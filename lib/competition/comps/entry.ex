defmodule Competition.Comps.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :distance, :integer
    field :time, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(entries, attrs) do
    entries
    |> cast(attrs, [:distance, :time])
    |> validate_required([:distance, :time])
  end
end
