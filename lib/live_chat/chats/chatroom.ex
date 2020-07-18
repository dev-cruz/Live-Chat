defmodule LiveChat.Chats.Chatroom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chatrooms" do
    has_many :messages, LiveChat.Chats.Message
    has_many :users, LiveChat.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(chatroom, attrs) do
    chatroom
    |> cast(attrs, [])
    |> validate_required([])
  end
end
