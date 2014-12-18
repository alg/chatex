# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, Chatex.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "ysDQEEBSEN5ctZIwMFwcSX8trVoFrzJVf4Fmu92lcyki7Yd/38SzRfqWidkTwMCdY1P1i5w2jzR/EhkyxDDZtQ==",
  debug_errors: false,
  error_controller: Chatex.PageController

# Session configuration
config :phoenix, Chatex.Router,
  session: [store: :cookie,
            key: "_chatex_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
