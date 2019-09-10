defmodule WorkingTimeManagerWeb.UserController do
  use WorkingTimeManagerWeb, :controller

  alias WorkingTimeManager.Resource
  alias WorkingTimeManager.Resource.User

  action_fallback WorkingTimeManagerWeb.FallbackController

  def index(conn, _params) do
    users = Resource.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Resource.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Resource.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Resource.get_user!(id)

    with {:ok, %User{} = user} <- Resource.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Resource.get_user!(id)

    with {:ok, %User{}} <- Resource.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
