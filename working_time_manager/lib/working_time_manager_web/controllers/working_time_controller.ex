defmodule WorkingTimeManagerWeb.WorkingTimeController do
  use WorkingTimeManagerWeb, :controller

  require Logger

  alias WorkingTimeManager.Resource
  alias WorkingTimeManager.Resource.WorkingTime

  action_fallback WorkingTimeManagerWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Resource.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"userid" => userid, "working_time" => working_time_userparams}) do
    {:ok, startdate, _} = DateTime.from_iso8601(Map.get(working_time_userparams, "start") <> "+00:00")
    {:ok, enddate, _} = DateTime.from_iso8601(Map.get(working_time_userparams, "end") <> "+00:00")
    working_time_params = %{
      :user  => userid,
      :start => startdate,
      :end => enddate
    }
    with {:ok, %WorkingTime{} = working_time} <- Resource.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> render("show.json", working_time: working_time)
    end
  end

  def show(conn, %{"userid" => useridstring, "id" => id}) do
    {userid, _} = Integer.parse(useridstring)
    working_time_for_id = Resource.get_working_time!(id)
    working_time = if userid == working_time_for_id.user do
      working_time_for_id
    else
      {}
    end
    render(conn, "show.json", working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = Resource.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- Resource.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = Resource.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- Resource.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
