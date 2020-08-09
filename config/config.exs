# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :inn,
  ecto_repos: [Inn.Repo]

# Configures the endpoint
config :inn, InnWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L++GVDd+3xleCl8Om0E2+mcDtUjNGi6Ds1CZq+/jif2vd0HFF6hkyolSBL1USZyN",
  render_errors: [view: InnWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Inn.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
