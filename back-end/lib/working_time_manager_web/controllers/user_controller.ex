defmodule WorkingTimeManagerWeb.UserController do
  use WorkingTimeManagerWeb, :controller

  import Ecto.Query
  import Logger

  alias WorkingTimeManager.Repo
  alias WorkingTimeManagerWeb.Authent.Token

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
    user_hashed_params = Map.put(user_params, "password", hashed_password)
    if Regex.match?(~r/[A-Za-z0-9-_]+@[A-Za-z0-9]+.[A-Za-z0-9]+$/, email) == false do
      raise "Your email #{email} is incorrect. Email must have this pattern : X@X.X"
    end
    user_with_same_email = Repo.one(from(u in User, where: u.email == ^email))
    if user_with_same_email != nil do
      conn
      |> put_status(:bad_request)
      |> json(%{error_message: "your email is already used"})
    else
      with {:ok, %User{} = user} <- Resource.create_user(user_hashed_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)
      else
        {:error, _message} -> send_resp(conn, :bad_request, "Bad request, cannot create user")
      end
    end
  end

  def show(conn, %{"id" => id}) do
    if conn.assigns.current_user != nil do
      #The next command raise an error in postman if there is no check of current_user value : function nil.email/0 is undefined
      Logger.info("connected user email: " <> conn.assigns.current_user.email)
      case Resource.get_user(id) do
        nil -> send_resp(conn, :not_found, "User not found")
        user -> render(conn, "show.json", user: user)
      end
    else
      send_resp(conn, :not_found, "You must be sign in to access to this page")
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
      query = from(u in User, where: u.email == ^email)
      user = Repo.one(query)
      if user != nil and Bcrypt.verify_pass(password, user.password) do
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
