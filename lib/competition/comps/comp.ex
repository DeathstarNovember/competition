defmodule Competition.Comps.Comp do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comps" do
    field :description, :string
    field :name, :string
    has_many: :contests, Contests

    timestamps()
  end

  @doc false
  def changeset(comp, attrs) do
    comp
    |> cast(attrs, [:name, :description, :contests])
    |> validate_required([:name, :description])
  end
end
