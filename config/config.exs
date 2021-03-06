# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :exchange,
  ecto_repos: [Exchange.Repo]

# Configures the endpoint
config :exchange, Exchange.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pUWThFm9jasTDGec8AoUeHagc0vLH7q/dpEGnSCWq3hr6CSM97x6OybB/qbxOPti",
  render_errors: [view: Exchange.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Exchange.PubSub,
           adapter: Phoenix.PubSub.PG2]

 config :exchange, basic_auth: [
    username: {:system, "USERNAME"},
    password: {:system, "PASSWORD"},
    realm:    "Prototype"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :exchange, Exchange.Client,
  clients: [
    %{
      token: "1234"
    },
    %{
      token: "4321"
    },
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
