defmodule WorkingTimeManagerWeb.Controllers.ControllerHelper do
    import Plug.Conn

    import Logger
    alias WorkingTimeManager.Resource

    def hasRightsToEditUser(conn, user_id) do
        connected_user = conn.assigns.current_user
        edited_user = Resource.get_user!(user_id)
        cond do
            connected_user == nil -> {:error, "Not logged in"}
            edited_user == nil -> {:error, "The user you try to access does not exist"}
            connected_user.id == edited_user.id -> {:ok, "ok"}
            connected_user.roles > edited_user.roles -> {:ok, "ok"}
            connected_user.roles == 3 -> {:ok, "ok"}
            true -> {:error, "not authorized"} # default
        end
    end

end
  