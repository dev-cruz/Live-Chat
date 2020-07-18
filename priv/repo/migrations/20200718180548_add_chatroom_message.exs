defmodule LiveChat.Repo.Migrations.AddChatroomMessage do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :chatroom_id, references(:chatrooms)
    end
  end
end
