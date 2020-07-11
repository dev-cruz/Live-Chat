defmodule LiveChatWeb.HomeController do
  use LiveChatWeb, :controller
  alias LiveChat.Accounts.User

  def index(%{assigns: %{user: user}} = conn, _params) do

    render(conn, "index.html", user: user)
  end
end