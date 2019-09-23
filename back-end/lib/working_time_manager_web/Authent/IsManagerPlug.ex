defmodule  WorkingTimeManagerWeb.Authent.IsManagerPlug do
    import Plug.Conn

    alias WorkingTimeManagerWeb.Authent

    def init(_params) do
    end
  
    def call(conn, _params) do
        if not Authent.Helper.isManagerOrGreater(conn) do
            conn
            |> send_resp(:unauthorized, "Not Manager")
            |> halt()
        else
            conn
        end
    end

  end
