defmodule CompetitionWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(CompetitionWeb.Schema.AccountTypes)

  query do
    import_fields(:account_queries)
    import_fields(:comp_queries)
  end

  mutation do
    import_fields(:account_mutations)
    import_fields(:comp_mutations)
  end

  subscription do
    import_fields(:account_subscriptions)
    import_fields(:comp_subscriptions)
  end
end