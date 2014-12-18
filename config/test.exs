use Mix.Config

config :phoenix, Chatex.Router,
  http: [port: System.get_env("PORT") || 4001],
