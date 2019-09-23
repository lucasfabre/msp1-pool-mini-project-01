defmodule  WorkingTimeManagerWeb.Authent.IsUserPlug do
    import Plug.Conn

    use WorkingTimeManagerWeb, :controller

    alias WorkingTimeManagerWeb.Authent
    require Logger

    def init(_params) do
    end
  
    def call(conn, _params) do
        if not Authent.Helper.isUserOrGreater(conn) do
            Logger.info("halted")
            conn
            |> send_resp(:unauthorized, "Not User")
            |> halt()
        else
            conn
        end
    end

  end