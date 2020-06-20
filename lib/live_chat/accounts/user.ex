defmodule LiveChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :token, :string
    field :email, :string
    field :name, :string
    field :image, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token, :email, :name, :image])
    |> validate_required([:token, :email, :email])
  end
end