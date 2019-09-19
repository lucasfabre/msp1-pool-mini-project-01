defmodule WorkingTimeManagerWeb.PageController do
  use WorkingTimeManagerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
