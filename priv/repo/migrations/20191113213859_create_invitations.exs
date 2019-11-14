defmodule Competition.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :status, :integer, null: false
      add :invitee_id, references(:users, on_delete: :delete_all)
      add :challenge_id, references(:challenges, on_delete: :delete_all)

      timestamps()
    end

    create index(:invitations, [:invitee_id])
    create index(:invitations, [:challenge_id])
  end
end
