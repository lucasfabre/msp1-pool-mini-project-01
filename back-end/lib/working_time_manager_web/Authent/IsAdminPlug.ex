defmodule  WorkingTimeManagerWeb.Authent.IsAdminPlug do
    import Plug.Conn

    alias WorkingTimeManagerWeb.Authent

    def init(_params) do
    end
  
    def call(conn, _params) do
        if not Authent.Helper.isAdmin(conn) do
            conn
            |> send_resp(:unauthorized, "Not Admin")
            |> halt()
        else
            conn
        end
    end

  end
