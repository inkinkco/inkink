# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :inkink,
  ecto_repos: [Inkink.Repo]

config :authsense, Inkink.User,
  repo: Inkink.Repo

# Configures the endpoint
config :inkink, Inkink.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wZRqdyUmfzwViXbK5O5gB/DPsL/VpYnUhh0aHTa+E+8+cJkaUHJA81qVuQxlvtf+",
  render_errors: [view: Inkink.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Inkink.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :arc,
  storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
