defmodule ClientSettingsApp.Repo do
  use Ecto.Repo,
    otp_app: :client_settings_app,
    adapter: Ecto.Adapters.Postgres
end
