defmodule  WorkingTimeManagerWeb.Authent.AuthentPlug do
    import Plug.Conn
  
    alias WorkingTimeManager.Resource
    alias WorkingTimeManagerWeb.Authent.Token

    def init(_params) do
    end
  
    def call(conn, _params) do
        token = fetch_cookies(conn).req_cookies["session_jwt"]
        if token != nil do
            with {:ok, %{"user_id" => id }} <- Token.verify_and_validate(token) do
                assign(conn, :current_user, Resource.get_user(id))
            else
                _ -> assign(conn, :current_user, nil)
            end
        else
            assign(conn, :current_user, nil)
        end
    end

  end