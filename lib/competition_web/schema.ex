defmodule CompetitionWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(CompetitionWeb.Schema.AccountTypes)
  import_types(CompetitionWeb.Schema.EntryTypes)
  import_types(CompetitionWeb.Schema.ChallengeTypes)

  query do
    import_fields(:account_queries)
    import_fields(:entry_queries)
    import_fields(:challenge_queries)
  end

  mutation do
    import_fields(:account_mutations)
    import_fields(:entry_mutations)
    import_fields(:challenge_mutations)
  end

  subscription do
    import_fields(:account_subscriptions)
    import_fields(:entry_subscriptions)
    import_fields(:challenge_subscriptions)
  end
end