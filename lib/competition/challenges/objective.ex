defmodule Competition.Challenges.Objective do
  use Ecto.Schema
  import Ecto.Changeset
  alias Competition.Challenges.Challenge

  schema "objectives" do
    field :objective_type, :integer
    field :result_type, :integer
    field :value, :integer
    belongs_to :challenge, Challenge

    timestamps()
  end

  @doc false
  def changeset(objective, attrs) do
    objective
    |> cast(attrs, [:objective_type, :result_type, :value, :challenge_id])
    |> validate_required([:objective_type, :result_type, :value, :challenge_id])
  end
end
