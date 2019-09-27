defmodule WorkingTimeManagerWeb.Router do
  use WorkingTimeManagerWeb, :router

  alias WorkingTimeManagerWeb.Authent

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :isUser do
    plug Authent.AuthentPlug
    plug Authent.IsUserPlug
  end

  pipeline :isManager do
    plug Authent.AuthentPlug
    plug Authent.IsManagerPlug
  end

  pipeline :isAdmin do
    plug Authent.AuthentPlug
    plug Authent.IsAdminPlug
  end

  scope "/", WorkingTimeManagerWeb do
    get "/", PageController, :index
  end

  scope "/api", WorkingTimeManagerWeb do
    pipe_through :api

    post "/sign_in", UserController, :sign_in
    post "/sign_up", UserController, :create
    post "/sign_out", UserController, :sign_out

    scope "/users" do
      pipe_through :isUser
      resources "/", UserController, except: [:new, :edit]
    end

    scope "/workingtimes/" do
      pipe_through :isManager
      get    "/:userid",     WorkingTimeController, :index
      get    "/:userid/:id", WorkingTimeController, :show
      post   "/:userid",     WorkingTimeController, :create
      delete "/:id",         WorkingTimeController, :delete
      put    "/:id",         WorkingTimeController, :update
    end

    scope "/clocks" do
      pipe_through :isUser
      get "/:user",  ClockController, :getclock
      post "/:user", ClockController, :clock
    end
  end

end
