defmodule WorkingTimeManagerWeb.UserView do
  use WorkingTimeManagerWeb, :view
  alias WorkingTimeManagerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email}
  end

  def render("error.json", %{code: code, message: message}) do
    %{error: %{code: code, message: message}}
  end
end
