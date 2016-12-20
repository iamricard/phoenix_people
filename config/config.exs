# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_people,
  ecto_repos: [PhoenixPeople.Repo]

# Configures the endpoint
config :phoenix_people, PhoenixPeople.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4of7V097+8ToMlbp5B2xYEq2uthtn41DXqSQfZD8QO3qGx0+So5bkDjo4W0T6Gq6",
  render_errors: [view: PhoenixPeople.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixPeople.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
