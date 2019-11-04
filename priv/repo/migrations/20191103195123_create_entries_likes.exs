defmodule Competition.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :entry_id, references(:entries, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:likes, [:user_id])
    create index(:likes, [:entry_id])
  end
end
