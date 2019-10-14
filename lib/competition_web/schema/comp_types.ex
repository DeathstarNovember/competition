defmodule CompetitionWeb.Schema.CompTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Competition.Repo

  alias CompetitionWeb.Resolvers

  @desc "Entry object"
  object :entry do
    field :id, :id
    field :user_id, :integer
    field :distance, :integer
    field :time, :integer
  end
  
  @desc "Contest object"
  object :contest do
    field :id, :id
    field :name, :string
    field :description, :string
    field :metric, :string
    field :objective, :integer
    field :comp_id, :integer
  end

  @desc "Comp object"
  object :comp do
    field :id, :id
    field :name, :string
    field :competitors, list_of(:user)
    field :contests, list_of(:contest)
  end
end