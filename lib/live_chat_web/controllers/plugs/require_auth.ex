defmodule LiveChatWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias LiveChatWeb.Router.Helpers, as: Routes

  def init(_params) do
  end

  def call(conn, _params) do
    case conn.assigns[:user] do
      nil ->
        conn
        |> redirect(to: Routes.auth_path(conn, :request, "github"))
        |> halt()

      user -> conn
    end
  end
end