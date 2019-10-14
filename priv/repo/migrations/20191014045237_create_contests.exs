defmodule Competition.Repo.Migrations.CreateContests do
  use Ecto.Migration

  def change do
    create table(:contests) do
      add :name, :string
      add :objective, :integer
      add :description, :string
      add :metric, :string
      add :comp_id, references(:comps, on_delete: :nothing)

      timestamps()
    end

  end
end
