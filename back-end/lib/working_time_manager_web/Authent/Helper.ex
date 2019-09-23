defmodule WorkingTimeManagerWeb.Authent.Helper do
    
    import Logger

    def isUserOrGreater(conn) do
        conn.assigns.current_user != nil
    end

    def isManagerOrGreater(conn) do
        Logger.info("level: " <> Kernel.inspect(conn.assigns.current_user != nil and conn.assigns.current_user.roles > 1))
        conn.assigns.current_user != nil and conn.assigns.current_user.roles > 1
    end

    def isAdmin(conn) do
        conn.assigns.current_user != nil and conn.assigns.current_user.roles > 2
    end

  end
  