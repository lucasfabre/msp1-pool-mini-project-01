defmodule WorkingTimeManagerWeb.WorkingTimeController do
  use WorkingTimeManagerWeb, :controller

  import Ecto.Query

  require Logger

  alias WorkingTimeManager.Repo
  alias WorkingTimeManager.Resource
  alias WorkingTimeManager.Utils.DateTimeHelper
  alias WorkingTimeManager.Resource.WorkingTime

  action_fallback WorkingTimeManagerWeb.FallbackController

  def index(conn, %{"userid" => userid_param, "start" => start_param, "end" => end_param}) do
    start_date   = DateTimeHelper.parse(start_param)
    end_date     = DateTimeHelper.parse(end_param)
    {userid, _}  = Integer.parse(userid_param)
    workingtimes = from(w in WorkingTime, where: w.start >= ^start_date and w.end <= ^end_date and w.user == ^userid)
      |> Repo.all()
    if workingtimes =! nil do
      render(conn, "index.json", workingtimes: workingtimes)
    else
      send_resp(conn, :ok, "No content")
    end
  end

  def create(conn, %{"userid" => userid, "working_time" => working_time_userparams}) do
    enddate = DateTimeHelper.parse(Map.get(working_time_userparams, "end"))
    startdate = DateTimeHelper.parse(Map.get(working_time_userparams, "start"))
    working_time_params = %{
      :user  => userid,
      :start => startdate,
      :end => enddate
    }
    if Regex.match?(~r/(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2})$/, enddate) == false || Regex.match?(~r/(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2})$/, startdate) == false do
      with {:ok, %WorkingTime{} = working_time} <- Resource.create_working_time(working_time_params) do
        conn
        |> put_status(:created)
        |> render("show.json", working_time: working_time)
      else
        {:error, _message} -> send_resp(conn, :bad_request, "Bad request, cannot create workingtime")
      end
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
