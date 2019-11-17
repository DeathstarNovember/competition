defmodule Competition.Challenges.Challenge do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Accounts.User
  alias Competition.Challenges.Objective
  alias Competition.Challenges.Invitation

  schema "challenges" do
    field :description, :string
    field :duration, :integer
    field :end_date, :naive_datetime
    field :name, :string
    field :start_date, :naive_datetime
    field :status, :integer
    belongs_to :moderator, User
    has_one :objective, Objective
    has_many :invitations, Invitation

    timestamps()
  end

  @doc false
  @required_fields ~w( duration status start_date end_date name description moderator_id )a
  @optional_fields ~w( )a
  def changeset(like, attrs) do
    like
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
