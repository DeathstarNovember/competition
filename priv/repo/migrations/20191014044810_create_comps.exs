defmodule Competition.Repo.Migrations.CreateComps do
  use Ecto.Migration

  def change do
    create table(:comps) do
      add :name, :string
      add :description, :string
      timestamps()
    end

  end
end
