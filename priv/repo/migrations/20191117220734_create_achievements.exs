defmodule Competition.Repo.Migrations.CreateAchievements do
  use Ecto.Migration

  def change do
    create table(:achievements) do
      add :achievement_type, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :entry_id, references(:entries, on_delete: :nothing)

      timestamps()
    end

    create index(:achievements, [:user_id])
    create index(:achievements, [:entry_id])
  end
end
