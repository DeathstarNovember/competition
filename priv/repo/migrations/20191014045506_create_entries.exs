defmodule Competition.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :distance, :integer, null: false
      add :time, :integer, null: false
      add :stroke_rate, :integer, null: false
      add :completed_at, :naive_datetime, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :user_weight, :float, null: false
      add :user_height, :integer, null: false
      add :max_hr, :integer
      add :avg_hr, :integer

      timestamps()
    end

    create index(:entries, [:user_id])
  end
end
