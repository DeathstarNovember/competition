defmodule Competition.Entries.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Competition.Entries.Entry
  alias Competition.Accounts.User

  schema "comments" do
    belongs_to :user, User
    belongs_to :entry, Entry
    field :body, :string
    field :visibility, :integer

    timestamps()
  end

  @doc false
  @required_fields ~w( body )a
  @optional_fields ~w( entry_id user_id visibility )a
  def changeset(like, attrs) do
    like
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
