defmodule ClientSettingsAppWeb.ClientSettingHTML do
  use ClientSettingsAppWeb, :html

  embed_templates "client_setting_html/*"

  @doc """
  Renders a client_setting form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def client_setting_form(assigns)
end
