defmodule WorkingTimeManagerWeb.Router do
  use WorkingTimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WorkingTimeManagerWeb do
    pipe_through :api

    post "/sign_in", UserController, :sign_in
    post "/sign_out", UserController, :sign_out

    resources "/users", UserController, except: [:new, :edit]

    scope "/workingtimes/" do
      get    "/:userid",     WorkingTimeController, :index
      get    "/:userid/:id", WorkingTimeController, :show
      post   "/:userid",     WorkingTimeController, :create
      delete "/:id",         WorkingTimeController, :delete
      put    "/:id",         WorkingTimeController, :update
    end

    scope "/clocks" do
      get "/:user",  ClockController, :getclock
      post "/:user", ClockController, :clock
    end
  end

end
