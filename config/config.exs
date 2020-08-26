# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :novy_api,
  ecto_repos: [NovyApi.Repo]

# Configures the endpoint
config :novy_api, NovyApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YiqL9FyTEz33ZzAhL+gP/ffSCcahfN2AV2KLJANDfbZKvpH44ep6mdLwwuCWpBe6",
  render_errors: [view: NovyApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NovyApi.PubSub,
  live_view: [signing_salt: "1hHvoEks"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
