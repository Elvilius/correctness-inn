use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :inn, InnWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :inn, Inn.Repo,
  username: "db_user",
  password: "12345678",
  database: "inn_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox
