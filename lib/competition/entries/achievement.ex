defmodule Competition.Entries.Achievement do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Entries.Entry
  alias Competition.Accounts.User

  schema "achievements" do
    field :achievement_type, :integer
    belongs_to :entry, Entry
    belongs_to :user, User

    timestamps()
  end

   @doc false
   @required_fields ~w( user_id entry_id achievement_type )a
   @optional_fields ~w( )a
   def changeset(like, attrs) do
     like
     |> cast(attrs, @required_fields ++ @optional_fields)
     |> validate_required(@required_fields)
   end
end
