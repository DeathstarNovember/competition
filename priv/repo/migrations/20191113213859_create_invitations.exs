defmodule Competition.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :status, :integer, null: false
      add :invitee_id, references(:users, on_delete: :delete_all)
      add :challenge_id, references(:challenges, on_delete: :delete_all)
      add :response_id, references(:entries, on_delete: :nothing)

      timestamps()
    end

    create index(:invitations, [:invitee_id])
    create index(:invitations, [:challenge_id])
    create index(:invitations, [:response_id])
  end
end
