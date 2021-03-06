defmodule CompetitionWeb.Schema.EntryTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Competition.Repo

  alias CompetitionWeb.Resolvers
  @desc "AchievementObject"
  object :achievement do
    field :id, :id
    field :achievement_type, :integer
    field :user, :user, resolve: assoc(:user)
    field :entry, :entry, resolve: assoc(:entry)
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end
  @desc "Comment object"
  object :comment do
    field :id, :id
    field :body, :string
    field :visibility, :integer
    field :user, :user, resolve: assoc(:user)
    field :entry, :entry, resolve: assoc(:entry)
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "Like object"
  object :like do
    field :id, :id
    field :user_id, :id
    field :entry_id, :id
  end 

  @desc "Entry object"
  object :entry do
    field :id, :id
    field :user, :user, resolve: assoc(:user)
    field :likes, list_of(:like) do
      resolve(
        assoc(:likes, fn likes_query, _args, _context ->
          likes_query
        end)
      )
    end
    field :comments, list_of(:comment) do
      resolve(
        assoc(:comments, fn comments_query, _args, _context ->
          comments_query 
        end)
      )
    end
    field :invitations, list_of(:invitation) do
      resolve assoc(:invitations, fn invitations_query, _args, _context ->
        invitations_query
      end)
    end
    field :achievement, :achievement, resolve: assoc(:achievement)
    field :distance, :integer
    field :time, :integer
    field :stroke_rate, :integer
    field :user_weight, :float
    field :user_height, :integer
    field :completed_at, :naive_datetime
    field :max_hr, :integer
    field :avg_hr, :integer
  end

  

  object :entry_queries do
    @desc "Get all entries"
    field :list_entries, list_of(:entry) do
      resolve(&Resolvers.EntriesResolver.list_entries/3)
    end
    @desc "Get a single entry"
    field :get_entry, :entry do
      resolve(&Resolvers.EntriesResolver.get_entry/3)
    end
    @desc "Get all achievements"
    field :list_achievements,  list_of(:achievement) do
      resolve(&Resolvers.EntriesResolver.list_achievements/3)
    end
  end

  object :entry_mutations do
    @desc "Create an entry"
    field :create_entry, :entry do
      arg(:time, non_null(:integer))
      arg(:distance, non_null(:integer))
      arg(:stroke_rate, non_null(:integer))
      arg(:completed_at, non_null(:naive_datetime))
      arg(:user_id, non_null(:id)) 
      arg(:user_weight, non_null(:float))
      arg(:user_height, non_null(:integer))
      arg(:max_hr, :integer)
      arg(:avg_hr, :integer) 

      resolve(&Resolvers.EntriesResolver.create_entry/3)
    end
    @desc "Update an entry"
    field :update_entry, :entry do
      arg(:id, non_null(:id))
      arg(:time, non_null(:integer))
      arg(:distance, non_null(:integer))
      arg(:stroke_rate, non_null(:integer))
      arg(:completed_at, non_null(:naive_datetime))
      arg(:user_id, non_null(:id)) 
      arg(:user_weight, non_null(:float)) 
      arg(:user_height, non_null(:integer)) 
      arg(:max_hr, :integer)
      arg(:avg_hr, :integer)

      resolve(&Resolvers.EntriesResolver.update_entry/3)
    end
    @desc "Delete an entry"
    field :delete_entry, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.EntriesResolver.delete_entry/3)
    end
    @desc "Delete a like"
    field :unlike_entry, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.EntriesResolver.unlike_entry/3)
    end
    @desc "Create a Like"
    field :like_entry, :like do
      arg(:user_id, non_null(:id))
      arg(:entry_id, non_null(:id))

      resolve(&Resolvers.EntriesResolver.like_entry/3)
    end
    @desc "Create a Comment"
    field :create_comment, :comment do
      arg(:user_id, non_null(:id))
      arg(:entry_id, non_null(:id))
      arg(:body, non_null(:string))
      arg(:visibility, :integer)

      resolve(&Resolvers.EntriesResolver.create_comment/3)
    end
    @desc "Create an Achievement" 
    field :create_achievement, :achievement do
      arg(:achievement_type, non_null(:integer)) 
      arg(:user_id, non_null(:id)) 
      arg(:entry_id, non_null(:id)) 
      resolve(&Resolvers.EntriesResolver.create_achievement/3)
    end
    @desc "Delete a Comment"
    field :delete_comment, :id do
      arg(:id, non_null(:id))
      resolve(&Resolvers.EntriesResolver.delete_comment/3)
    end
    @desc "Update a Comment"
    field :update_comment, :comment do
      arg(:id, non_null(:id))
      arg(:body, non_null(:string)) 
      arg(:visibility, :integer) 

      resolve(&Resolvers.EntriesResolver.update_comment/3)
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