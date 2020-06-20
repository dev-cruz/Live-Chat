defmodule LiveChatWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _params) do
    user = get_session(conn, :user)

    cond do
      user == nil ->
        conn
        |> assign(:user, nil)
      true ->
        conn
        |> assign(:user, user)
    end
  end
end