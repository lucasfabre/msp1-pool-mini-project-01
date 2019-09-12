defmodule WorkingTimeManagerWeb.Router do
  use WorkingTimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WorkingTimeManagerWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]

    scope "/workingtimes/" do
      post "/:userid", WorkingTimeController, :create
      get "/:userid/:id", WorkingTimeController, :show
    end

    scope "/clocks" do
      get "/:user", ClockController, :getclock
      post "/:user", ClockController, :clock
    end
  end

end
