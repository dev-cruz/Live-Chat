defmodule LiveChatWeb.PageLive do
  use LiveChatWeb, :live_view

  @impl true
  def mount(_params, %{"user" => user}, socket) do
    socket = assign(socket, user: user, chats: nil)
    {:ok, socket}
  end

  @impl true
  def handle_event("search_user", %{"query" => query}, socket) do
    IO.puts query

    {:noreply, socket}
  end
end
