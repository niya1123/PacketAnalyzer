# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :packet_analyzer, PacketAnalyzerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uJ402ojhS93ASxGLut0A2ueGZuv8BROKZgi6mZwBQCq+36gr+G5NcDJdx7tLCEFz",
  render_errors: [view: PacketAnalyzerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PacketAnalyzer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
