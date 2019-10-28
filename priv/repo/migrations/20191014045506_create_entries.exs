defmodule Competition.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :distance, :integer
      add :time, :integer
      add :stroke_rate, :integer
      add :completed_at, :naive_datetime
      add :user_id, references(:users, on_delete: :nothing)
      add :user_weight, :float
      add :user_height, :integer
      add :max_hr, :integer
      add :avg_hr, :integer

      timestamps()
    end

    create index(:entries, [:user_id])
  end
end
