defmodule Competition.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Entries.Entry

  schema "users" do
    field :dob, :naive_datetime
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :username, :string
    field :war_cry, :string
    has_many :entries, Entry

    timestamps()
  end

  @required_fields ~w(dob email first_name last_name password_hash username)a
  @optional_fields ~w(war_cry)a
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
