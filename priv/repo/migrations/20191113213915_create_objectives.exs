defmodule Competition.Repo.Migrations.CreateObjectives do
  use Ecto.Migration

  def change do
    create table(:objectives) do
      add :objective_type, :integer, null: false
      add :result_type, :integer, null: false
      add :value, :integer, null: false
      add :challenge_id, references(:challenges, on_delete: :delete_all)

      timestamps()
    end

    create index(:objectives, [:challenge_id])
  end
end
