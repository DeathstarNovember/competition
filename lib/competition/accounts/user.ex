defmodule Competition.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Entries.Entry
  alias Competition.Entries.Like
  alias Competition.Entries.Comment
  alias Competition.Entries.Achievement
  alias Competition.Accounts.FollowLink
  alias Competition.Challenges.Challenge
  alias Competition.Challenges.Invitation

  schema "users" do
    field :dob, :naive_datetime
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :bio_sex, :string
    field :current_weight, :float
    field :current_height, :integer
    field :username, :string
    field :war_cry, :string
    has_many :entries, Entry
    has_many :likes, Like
    has_many :comments, Comment
    has_many :invitations, Invitation, foreign_key: :invitee_id
    has_many :challenges, Challenge, foreign_key: :moderator_id
    has_many :followed_links, FollowLink, foreign_key: :follower_id
    has_many :follows, through: [:followed_links, :followed]
    has_many :follower_links, FollowLink, foreign_key: :followed_id
    has_many :followers, through: [:follower_links, :follower]
    has_many :achievements, Achievement

    timestamps()
  end

  @required_fields ~w(dob email first_name last_name bio_sex current_weight current_height username)a
  @optional_fields ~w(war_cry)a
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
