defmodule ClientSettingsApp.Repo.Migrations.CreateClientSettings do
  use Ecto.Migration

  def change do
    create table(:client_settings) do
      add :time_offset, :integer
      add :bulk, :string

      timestamps(type: :utc_datetime)
    end
  end
end
