defmodule CompetitionWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(CompetitionWeb.Schema.AccountTypes)
  import_types(CompetitionWeb.Schema.EntryTypes)

  query do
    import_fields(:account_queries)
    import_fields(:entry_queries)
  end

  mutation do
    import_fields(:account_mutations)
    import_fields(:entry_mutations)
  end

  subscription do
    import_fields(:account_subscriptions)
    import_fields(:entry_subscriptions)
  end
end