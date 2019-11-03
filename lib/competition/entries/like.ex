defmodule Competition.Entries.Like do
  use Ecto.Schema
  import Ecto.Changeset

  alias Competition.Accounts.User
  alias Competition.Entries.Like

  schema "likes" do
    field :user_id, :id
    field :entry_id, :id
    # belongs_to :user, User
    # belongs_to :like, Like

    timestamps()
  end

  @doc false
  @required_fields ~w(entry_id user_id)a
  @optional_fields ~w( )a
  def changeset(like, attrs) do
    like
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end