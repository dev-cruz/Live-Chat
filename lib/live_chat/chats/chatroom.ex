defmodule LiveChat.Chats.Chatroom do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveChat.Chats

  schema "chatrooms" do
    has_many :messages, Chats.Message
    many_to_many :chatrooms, LiveChat.Accounts.User, join_through: Chats.UserChatroom
  end
end