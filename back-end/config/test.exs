use Mix.Config

# Configure your database
config :working_time_manager, WorkingTimeManager.Repo,
  username: "postgres",
  password: "postgres",
  database: "working_time_manager_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :working_time_manager, WorkingTimeManagerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
