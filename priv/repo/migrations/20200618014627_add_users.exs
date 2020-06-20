defmodule LiveChat.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :token, :string
      add :email, :string
      add :name, :string
      add :image, :string

      timestamps()
    end
  end
end
