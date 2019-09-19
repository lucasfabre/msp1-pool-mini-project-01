defmodule WorkingTimeManager.Repo do
  use Ecto.Repo,
    otp_app: :working_time_manager,
    adapter: Ecto.Adapters.Postgres
end
