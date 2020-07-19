defmodule LiveChat.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    belongs_to :user, LiveChat.Accounts.User
    belongs_to :chatroom, LiveChat.Chats.Chatroom

    timestamps()
  end

  def changeset(message, params \\ %{}) do
    message
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end