defmodule CompetitionWeb.Schema.EntryTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Competition.Repo

  alias CompetitionWeb.Resolvers

  @desc "Entry object"
  object :entry do
    field :id, :id
    field :user, :user, resolve: assoc(:user)
    field :distance, :integer
    field :time, :integer
    field :stroke_rate, :integer
    field :completed_at, :naive_datetime
  end

  object :entry_queries do
    @desc "Get all entries"
    field :list_entries, list_of(:entry) do
      resolve(&Resolvers.EntriesResolver.list_entries/3)
    end
  end

  object :entry_mutations do
    @desc "Create an entry"
    field :create_entry, :entry do
      arg(:time, non_null(:integer))
      arg(:distance, non_null(:integer))
      arg(:stroke_rate, non_null(:integer))
      arg(:completed_at, non_null(:naive_datetime))
      arg(:user_id, non_null(:integer)) #???

      resolve(&Resolvers.EntriesResolver.create_entry/3)
    end
  end

  object :entry_subscriptions do
    @desc "Populate new entries"
    field :entry_created, :entry do
      config(fn _, _ ->
        {:ok, topic: "entries"}
      end)

      trigger(:create_entry,
        topic: fn _ ->
          "entries"
        end
      )
    end
  end
end