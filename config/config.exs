# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shopmap,
  ecto_repos: [Shopmap.Repo]

# Configures the endpoint
config :shopmap, ShopmapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QXCcxmW5MRk1pT/+hkW3BMZacCLNqmHV6Qo6gCUY/keI7cfgZvt7ipH/jXTPPT0N",
  render_errors: [view: ShopmapWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Shopmap.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
