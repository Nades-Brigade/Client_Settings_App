defmodule ClientSettingsAppWeb.ClientSettingControllerTest do
  use ClientSettingsAppWeb.ConnCase

  import ClientSettingsApp.ClientSettingsFixtures

  @create_attrs %{time_offset: 42, bulk: "some bulk"}
  @update_attrs %{time_offset: 43, bulk: "some updated bulk"}
  @invalid_attrs %{time_offset: nil, bulk: nil}

  describe "index" do
    test "lists all client_settings", %{conn: conn} do
      conn = get(conn, ~p"/client_settings")
      assert html_response(conn, 200) =~ "Listing Client settings"
    end
  end

  describe "new client_setting" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/client_settings/new")
      assert html_response(conn, 200) =~ "New Client setting"
    end
  end

  describe "create client_setting" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/client_settings", client_setting: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/client_settings/#{id}"

      conn = get(conn, ~p"/client_settings/#{id}")
      assert html_response(conn, 200) =~ "Client setting #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/client_settings", client_setting: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Client setting"
    end
  end

  describe "edit client_setting" do
    setup [:create_client_setting]

    test "renders form for editing chosen client_setting", %{conn: conn, client_setting: client_setting} do
      conn = get(conn, ~p"/client_settings/#{client_setting}/edit")
      assert html_response(conn, 200) =~ "Edit Client setting"
    end
  end

  describe "update client_setting" do
    setup [:create_client_setting]

    test "redirects when data is valid", %{conn: conn, client_setting: client_setting} do
      conn = put(conn, ~p"/client_settings/#{client_setting}", client_setting: @update_attrs)
      assert redirected_to(conn) == ~p"/client_settings/#{client_setting}"

      conn = get(conn, ~p"/client_settings/#{client_setting}")
      assert html_response(conn, 200) =~ "some updated bulk"
    end

    test "renders errors when data is invalid", %{conn: conn, client_setting: client_setting} do
      conn = put(conn, ~p"/client_settings/#{client_setting}", client_setting: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Client setting"
    end
  end

  describe "delete client_setting" do
    setup [:create_client_setting]

    test "deletes chosen client_setting", %{conn: conn, client_setting: client_setting} do
      conn = delete(conn, ~p"/client_settings/#{client_setting}")
      assert redirected_to(conn) == ~p"/client_settings"

      assert_error_sent 404, fn ->
        get(conn, ~p"/client_settings/#{client_setting}")
      end
    end
  end

  defp create_client_setting(_) do
    client_setting = client_setting_fixture()
    %{client_setting: client_setting}
  end
end
