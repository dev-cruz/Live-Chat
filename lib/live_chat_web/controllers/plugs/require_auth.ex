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
        |> put_flash(:error, "You need to be logged in")
        |> redirect(to: Routes.home_path(conn, :index))
        |> halt()

      user -> conn
    end
  end
end