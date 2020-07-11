defmodule LiveChatWeb.ChatLive do
  use LiveChatWeb, :live_component

  def render(assigns) do
    ~L"""
    <span>Hello <strong><%= @user.name %></strong>. Start a conversation!</span>
    """
  end

  def update(assigns, socket) do
    # here, we're fetching the messages of a given chat id...

    {:ok, assign(socket, user: assigns.user)}
  end
end