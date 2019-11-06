defmodule Competition.Accounts.FollowLink do
  use Ecto.Schema
  import Ecto.Changeset

  alias Competition.Accounts.User

  schema "follow_links" do
    belongs_to :follower, User
    belongs_to :followed, User

    timestamps()
  end

  @doc false
  @required_fields ~w(followed_id follower_id)a
  @optional_fields ~w( )a
  def changeset(follow_link, attrs) do
    follow_link
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
