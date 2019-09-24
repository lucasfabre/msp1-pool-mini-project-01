defmodule WorkingTimeManagerWeb.ClockController do
  use WorkingTimeManagerWeb, :controller

  require Logger

  import Ecto.Query

  alias WorkingTimeManager.Repo
  alias WorkingTimeManager.Resource
  alias WorkingTimeManager.Resource.Clock
  alias WorkingTimeManager.Utils.DateTimeHelper 

  action_fallback WorkingTimeManagerWeb.FallbackController

  def getclock(conn, %{"user" => user}) do
    params = conn.query_params
    if not Map.has_key?(params, "start") and not Map.has_key?(params, "end") do
        clock = from(c in Clock, where: c.user == ^user, order_by: [desc: c.date], limit: 1)
        |> Repo.one()
      if clock != nil do
        render(conn, "show.json", clock: clock)
      else
        send_resp(conn, :ok, "No content")
      end
    else
      end_date   = DateTimeHelper.parse(params["end"])
      start_date = DateTimeHelper.parse(params["start"])
      clocks = from(c in Clock, where: c.user == ^user and c.date >= ^start_date and c.date <= ^end_date, order_by: [desc: c.date])
        |> Repo.all()
      if clocks != nil do
        render(conn, "index.json", clocks: clocks)
      else
        send_resp(conn, :ok, "No content")
      end
    end
  end

  def clock(conn, %{"user" => userid_string} = params) do
    {userid, _} = Integer.parse(userid_string)
    clock_params =
    if false == Map.has_key?(params, "date") or false == Map.has_key?(params, "status") do
      last_clock = from(c in Clock, where: c.user == ^userid, order_by: [desc: c.date], limit: 1)
        |> Repo.one()
      %{
        "status" => last_clock == nil || last_clock.status == false,
        "user" => userid,
        "date" => DateTime.utc_now()
      }
    else
      %{
        "status" => params["status"],
        "user" => userid,
        "date" => DateTimeHelper.parse(params["date"])
      }
    end
    with {:ok, %Clock{} = clock} <- Resource.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    else
      {:error, _message} -> send_resp(conn, :not_found, "No clock")
    end
  end

end
