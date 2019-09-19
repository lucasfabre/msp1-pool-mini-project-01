defmodule WorkingTimeManagerWeb.UserController do
  use WorkingTimeManagerWeb, :controller

  import Ecto.Query
  import Logger

  alias WorkingTimeManager.Repo
  alias WorkingTimeManager.Token

  alias WorkingTimeManager.Resource
  alias WorkingTimeManager.Resource.User

  action_fallback WorkingTimeManagerWeb.FallbackController

  def index(conn, _params) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.query_params
    users = if Map.has_key?(params, "email") do
      query = from(u in User, where: u.email == ^params["email"])
      Repo.all(query)
    end
    if users != nil do
      render(conn, "index.json", users: users)
    else
      send_resp(conn, :ok, "No content")
    end
  end

  def create(conn, %{"user" => user_params}) do
    email = user_params["email"]
    hashed_password = Bcrypt.hash_pwd_salt(user_params["password"])
    user_hashed_params = %{
      :email => Map.get(user_params, "email"),
      :firstname => Map.get(user_params, "firstname"),
      :lastname => Map.get(user_params, "lastname"),
      :password => hashed_password,
      :roles => Map.get(user_params, "roles")
    }
    if Regex.match?(~r/[A-Za-z0-9-_]+@[A-Za-z0-9]+.[A-Za-z0-9]+$/, email) == false do
      raise "Your email #{email} is incorrect. Email must have this pattern : X@X.X"
    end
    with {:ok, %User{} = user} <- Resource.create_user(user_hashed_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)
    else
      {:error, _message} -> send_resp(conn, :bad_request, "Bad request, cannot create user")
    end
  end

  def show(conn, %{"id" => id}) do
    token = fetch_cookies(conn).req_cookies["session_jwt"]
    {:ok, claims} = Token.verify_and_validate(token)
    Logger.info("connected user id: " <> claims["user_id"])
    case Resource.get_user(id) do
      nil -> send_resp(conn, :not_found, "User not found")
      user -> render(conn, "show.json", user: user)
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
      hashed_password = Bcrypt.hash_pwd_salt(password)
      query = from(u in User, where: u.email == ^email and u.password == ^hashed_password)
      user = Repo.one(query)
      if user != nil do
        extra_claims = %{"user_id" => Integer.to_string(user.id)}
        token = Token.generate_and_sign!(extra_claims)
        conn
        |> put_resp_cookie("session_jwt", token)
        |> json(%{ status: true })
      else
        json conn, %{ status: false }
      end
  end

  def sign_out(conn, _params) do
    conn
    |> delete_resp_cookie("session_jwt")
    |> json(%{message: "ok"})
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Resource.get_user!(id)

    with {:ok, %User{} = user} <- Resource.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    else
      {:error, _message} -> send_resp(conn, :bad_request, "Bad request, cannot update user")
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Resource.get_user!(id)

    with {:ok, %User{}} <- Resource.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
