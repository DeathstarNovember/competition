defmodule Competition.Entries.Entry do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Accounts.User

  schema "entries" do
    field :distance, :integer
    field :time, :integer
    field :stroke_rate, :integer
    field :completed_at, :naive_datetime
    belongs_to :user, User

    timestamps()
  end

  @doc false
  @required_fields ~w(distance time stroke_rate completed_at user_id)a
  @optional_fields ~w()a
  def changeset(entries, attrs) do
    entries
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
