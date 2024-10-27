# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :gist,
  ecto_repos: [Gist.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :gist, GistWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: GistWeb.ErrorHTML, json: GistWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Gist.PubSub,
  live_view: [signing_salt: "50CJ11FD"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :gist, Gist.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  gist: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  gist: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :kaffy,
  # required keys
  # required
  otp_app: :gist,
  # required
  ecto_repo: Gist.Repo,
  # required
  router: GistWeb.Router,
  # optional keys
  admin_title: "Elixir Gist",
  admin_logo: [
    url: "/images/gist-logo.svg",
    style: "width:40;height:40px;"
  ],
  admin_logo_mini: "/images/logo-mini.png",
  hide_dashboard: false,
  home_page: [schema: [:accounts, :user]],
  # since v0.10.0
  enable_context_dashboards: true,
  # since v0.10.0
  admin_footer: "Elixir Gist &copy; 2024"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
