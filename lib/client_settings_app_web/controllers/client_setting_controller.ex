defmodule ClientSettingsAppWeb.ClientSettingController do
  use ClientSettingsAppWeb, :controller

  alias ClientSettingsApp.ClientSettings
  alias ClientSettingsApp.ClientSettings.ClientSetting

  def index(conn, _params) do
    client_settings = ClientSettings.list_client_settings()
    render(conn, :index, client_settings: client_settings)
  end

  def new(conn, _params) do
    changeset = ClientSettings.change_client_setting(%ClientSetting{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"client_setting" => client_setting_params}) do
    case ClientSettings.create_client_setting(client_setting_params) do
      {:ok, client_setting} ->
        conn
        |> put_flash(:info, "Client setting created successfully.")
        |> redirect(to: ~p"/client_settings/#{client_setting}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_setting = ClientSettings.get_client_setting!(id)
    render(conn, :show, client_setting: client_setting)
  end

  def edit(conn, %{"id" => id}) do
    client_setting = ClientSettings.get_client_setting!(id)
    changeset = ClientSettings.change_client_setting(client_setting)
    render(conn, :edit, client_setting: client_setting, changeset: changeset)
  end

  def update(conn, %{"id" => id, "client_setting" => client_setting_params}) do
    client_setting = ClientSettings.get_client_setting!(id)

    case ClientSettings.update_client_setting(client_setting, client_setting_params) do
      {:ok, client_setting} ->
        conn
        |> put_flash(:info, "Client setting updated successfully.")
        |> redirect(to: ~p"/client_settings/#{client_setting}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, client_setting: client_setting, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_setting = ClientSettings.get_client_setting!(id)
    {:ok, _client_setting} = ClientSettings.delete_client_setting(client_setting)

    conn
    |> put_flash(:info, "Client setting deleted successfully.")
    |> redirect(to: ~p"/client_settings")
  end
end
