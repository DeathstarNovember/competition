defmodule Competition.Challenges.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Accounts.User
  alias Competition.Entries.Entry
  alias Competition.Challenges.Challenge

  schema "invitations" do
    field :status, :integer
    belongs_to :invitee, User
    belongs_to :challenge, Challenge
    belongs_to :response, Entry

    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:status, :invitee_id, :challenge_id, :response_id])
    |> validate_required([:status, :invitee_id, :challenge_id])
  end
end
