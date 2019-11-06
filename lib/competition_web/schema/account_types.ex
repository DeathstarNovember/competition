defmodule CompetitionWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Competition.Repo

  alias CompetitionWeb.Resolvers
  @desc "FollowLink Object"
  object :follow_link do
      field :id, :id
      field :follower, :user, resolve: assoc(:follower)
      field :followed, :user, resolve: assoc(:followed)
  end

  @desc "User object"
  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :bio_sex, :string
    field :current_weight, :float
    field :current_height, :integer
    field :dob, :naive_datetime
    field :username, :string
    field :email, :string
    field :war_cry, :string
    field :follows, list_of(:user) do
      resolve(
        assoc(:follows, fn follows_query, _args, _context -> 
          follows_query
        end)
      )
    end
    field :followers, list_of(:user) do
      resolve(
        assoc(:followers, fn followers_query, _args, _context -> 
          followers_query
        end)
      )
    end
    field :entries, list_of(:entry) do
      resolve(
        assoc(:entries, fn entries_query, _args, _context ->
          entries_query 
        end)
      )
    end
    field :likes, list_of(:like) do
      resolve(
        assoc(:likes, fn likes_query, _args, _context ->
          likes_query 
        end)
      )
    end
  end

  object :account_queries do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      resolve(&Resolvers.AccountsResolver.list_users/3)
    end

    @desc "Get a user"
    field :get_user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.AccountsResolver.get_user/3)
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
      arg(:bio_sex, non_null(:string))
      arg(:current_weight, non_null(:float))
      arg(:current_height, non_null(:integer))
      arg(:war_cry, non_null(:string))

      resolve(&Resolvers.AccountsResolver.create_user/3)
    end
    @desc "Create a follow"
    field :create_follow_link, :follow_link do
      arg(:follower_id, non_null(:id))
      arg(:followed_id, non_null(:id))

      resolve(&Resolvers.AccountsResolver.create_follow_link/3)
    end
    @desc "Update a user"
    field :update_user, :user do
      arg(:id, non_null(:id))
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:dob, non_null(:naive_datetime))
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:bio_sex, non_null(:string))
      arg(:current_weight, non_null(:float))
      arg(:current_height, non_null(:integer))
      arg(:war_cry, non_null(:string))

      resolve(&Resolvers.AccountsResolver.update_user/3)
    end
    @desc "Delete a User"
    field :delete_user, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.AccountsResolver.delete_user/3)
    end
    @desc "Delete a Follow"
    field :delete_follow_link, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.AccountsResolver.delete_follow_link/3)
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