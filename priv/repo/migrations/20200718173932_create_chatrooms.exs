defmodule LiveChat.Repo.Migrations.CreateChatrooms do
  use Ecto.Migration

  def change do
    create table(:chatrooms) do
      add :user_id, references(:users)

      timestamps()
    end

  end
end
