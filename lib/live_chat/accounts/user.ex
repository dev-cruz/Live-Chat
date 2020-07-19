defmodule LiveChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveChat.Chats

  schema "users" do
    field :token, :string
    field :email, :string
    field :name, :string
    field :image, :string
    has_many :messages, Chats.Message
    many_to_many :chatrooms, Chats.Chatrooms, join_through: Chats.UserChatroom

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token, :email, :name, :image])
    |> validate_required([:token, :email, :email])
  end
end