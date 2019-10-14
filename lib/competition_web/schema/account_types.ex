defmodule CompetitionWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Competition.Repo

  alias CompetitionWeb.Resolvers

  @desc "User object"
  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :dob, :naive_datetime
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :war_cry, :string
    field :entries, list_of(:entry) do
      resolve(
        assoc(:entries, fn entries_query, _args, _context ->
          entries_query 
        end)
      )
    end
  end

  object :account_queries do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      resolve(&Resolvers.AccountResolver.list_users/3)
    end
  end

  object :account_mutations do
    @desc "Create a user"
    field :create_user, :user do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:dob, non_null(:naive_datetime))
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password_hash, non_null(:string))
      arg(:war_cry, non_null(:string))

      resolve(&Resolvers.AccountResolver.create_user/3)
    end
  end

  object :account_subscriptions do
    @desc "Populate new users"
    field :user_created, :user do
      config(fn _, _ ->
        {:ok, topic: "users"}
      end)

      trigger(:create_user,
        topic: fn _ ->
          "users"
        end
      )
    end
  end
end