import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hack_day_api, HackDayApi.Repo,
  username: "sa",
  password: "some!Password",
  hostname: "localhost",
  database: "hack_day_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hack_day_api, HackDayApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "20m0Ya5xj6XUn8yn1Agmt4fcQpC/ipj+kv1yoJQM3kGPOcDXPycRAlpVstFeN61B",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
