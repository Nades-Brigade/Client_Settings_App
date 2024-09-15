defmodule ClientSettingsApp.ClientSettings.ClientSetting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client_settings" do
    field :time_offset, :integer
    field :bulk, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client_setting, attrs) do
    client_setting
    |> cast(attrs, [:time_offset, :bulk])
    |> validate_required([:time_offset, :bulk])
  end
end
