# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_chat,
  ecto_repos: [LiveChat.Repo]

# Configures the endpoint
config :live_chat, LiveChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zv7ycTSS4OTRyEhIBySA2nj7t1SUKB+iYHX3wK3lG554dJ0IqYJRAnf9ZXVKdqfn",
  render_errors: [view: LiveChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveChat.PubSub,
  live_view: [signing_salt: "PTX8OU2S"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID") || "",
  client_secret: System.get_env("GITHUB_CLIENT_SECRET") || ""

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
