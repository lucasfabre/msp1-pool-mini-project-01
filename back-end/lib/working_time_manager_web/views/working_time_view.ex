defmodule WorkingTimeManagerWeb.WorkingTimeView do
  use WorkingTimeManagerWeb, :view
  alias WorkingTimeManagerWeb.WorkingTimeView

  def render("index.json", %{workingtimes: workingtimes}) do
    %{data: render_many(workingtimes, WorkingTimeView, "working_time.json")}
  end

  def render("show.json", %{working_time: working_time}) do
    %{data: render_one(working_time, WorkingTimeView, "working_time.json")}
  end

  def render("working_time.json", %{working_time: working_time}) do
    %{id: working_time.id,
      start: WorkingTimeManager.Utils.DateTimeHelper.format(working_time.start),
      end: WorkingTimeManager.Utils.DateTimeHelper.format(working_time.end),
      user: working_time.user}
  end
end
