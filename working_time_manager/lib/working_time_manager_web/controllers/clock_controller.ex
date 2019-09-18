defmodule WorkingTimeManagerWeb.ClockController do
  use WorkingTimeManagerWeb, :controller

  require Logger

  import Ecto.Query

  alias WorkingTimeManager.Repo
  alias WorkingTimeManager.Resource
  alias WorkingTimeManager.Resource.User
  alias WorkingTimeManager.Resource.Clock

  action_fallback WorkingTimeManagerWeb.FallbackController

  def getclock(conn, %{"user" => user}) do
    clock = from(c in Clock, where: c.user == ^user, order_by: [desc: c.time], limit: 1)
      |> Repo.one()
    if clock != nil do
      render(conn, "show.json", clock: clock)
    else
      send_resp(conn, :ok, "No content")
    end
  end

  def clock(conn, %{"user" => useridstring}) do
    {userid, _} = Integer.parse(useridstring)
    last_clock = from(c in Clock, where: c.user == ^userid, order_by: [desc: c.time], limit: 1)
      |> Repo.one()
    clock_params = %{
      "status" => last_clock == nil || last_clock.status == false,
      "user" => userid,
      "time" => DateTime.utc_now()}
    with {:ok, %Clock{} = clock} <- Resource.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end

end
