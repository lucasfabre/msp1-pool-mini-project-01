defmodule WorkingTimeManagerWeb.Router do
  use WorkingTimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WorkingTimeManagerWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end

end
