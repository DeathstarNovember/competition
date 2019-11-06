defmodule Competition.Repo.Migrations.CreateFollowLinks do
  use Ecto.Migration

  def change do
    create table(:follow_links) do
      add :followed_id, references(:users, on_delete: :delete_all)
      add :follower_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:follow_links, [:follower_id, :followed_id], name: :follow_links_follower_id_followed_id_index)
  end
end
