defmodule Competition.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false
      add :bio_sex, :string, null: false
      add :current_weight, :float, null: false
      add :current_height, :integer, null: false
      add :dob, :naive_datetime, null: false
      add :war_cry, :string

      timestamps()
    end

  end
end
