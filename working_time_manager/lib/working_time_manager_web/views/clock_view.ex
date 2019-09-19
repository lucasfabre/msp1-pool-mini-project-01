defmodule WorkingTimeManagerWeb.ClockView do
  use WorkingTimeManagerWeb, :view
  alias WorkingTimeManagerWeb.ClockView

  def render("index.json", %{clocks: clocks}) do
    %{data: render_many(clocks, ClockView, "clock.json")}
  end

  def render("show.json", %{clock: clock}) do
    %{data: render_one(clock, ClockView, "clock.json")}
  end

  def render("clock.json", %{clock: clock}) do
    %{id: clock.id,
      date: clock.date,
      status: clock.status,
      user: clock.user}
  end
end
