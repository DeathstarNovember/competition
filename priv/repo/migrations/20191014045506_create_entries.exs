defmodule Competition.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :distance, :integer
      add :time, :integer
      add :stroke_rate, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:entries, [:user_id])
  end
end
