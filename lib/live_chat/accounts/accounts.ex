defmodule LiveChat.Accounts do
  import Ecto.Query, warn: false

  alias LiveChat.Repo
  alias LiveChat.Accounts.User


  def list_users do
    Repo.all(User)
  end

  def get_user(id) do
    Repo.get!(User, id)
  end

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()

  end
end
