defmodule Competition.Comps.Contest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contests" do
    field :description, :string
    field :metric, :string
    field :name, :string
    field :objective, :integer
    belongs_to :comp, Comp


    timestamps()
  end

  @doc false
  def changeset(contests, attrs) do
    contests
    |> cast(attrs, [:name, :objective, :description, :metric])
    |> validate_required([:name, :objective, :description, :metric])
  end
end
