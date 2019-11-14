defmodule Competition.Repo.Migrations.CreateChallenges do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :status, :integer, null: false
      add :start_date, :naive_datetime, null: false
      add :end_date, :naive_datetime
      add :duration, :integer, null: false
      add :name, :string
      add :description, :string
      add :moderator_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:challenges, [:moderator_id])
  end
end
