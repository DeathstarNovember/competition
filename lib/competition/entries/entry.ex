defmodule Competition.Comps.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :distance, :integer
    field :time, :integer
    field :stroke_rate, :integer
    belongs_to :user, User

    timestamps()
  end

  @doc false
  @required_fields ~w(distance time stroke_rate user_id)a
  @optional_fields ~w()a
  def changeset(entries, attrs) do
    entries
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
