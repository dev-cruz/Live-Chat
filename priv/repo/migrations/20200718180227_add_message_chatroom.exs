defmodule LiveChat.Repo.Migrations.AddMessageChatroom do
  use Ecto.Migration

  def change do
    alter table(:chatrooms) do
      add :message_id, references(:messages)
    end
  end
end
