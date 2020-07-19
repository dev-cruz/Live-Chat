defmodule LiveChat.Chats do
  import Ecto
  import Ecto.Query, warn: false

  alias LiveChat.Repo
  alias LiveChat.Chats.Message
  alias LiveChat.Chats.Chatroom

  def create_message(message, chatroom, user_id) do
    chatroom
    |> build_assoc(:messages, user_id: user_id)
    |> Message.changeset(%{content: message})
    |> Repo.insert()
  end

  def create_chatroom(users, chatroom) do
    
  end
end