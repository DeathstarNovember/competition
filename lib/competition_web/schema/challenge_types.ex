defmodule CompetitionWeb.Schema.ChallengeTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Competition.Repo

  alias CompetitionWeb.Resolvers
  @desc "Invitation object"
  object :invitation do
    field :id, :id 
    field :status, :integer
    field :challenge, :challenge, resolve: assoc(:challenge)
    field :invitee, :user, resolve: assoc(:invitee)
    field :response, :entry, resolve: assoc(:response)
  end
  @desc "Objective object"
  object :objective do
    field :id, :id
    field :objective_type, :integer
    field :result_type, :integer
    field :challenge, :challenge, resolve: assoc(:challenge)
    field :value, :integer
  end
  @desc "Challenge object"
  object :challenge do
    field :id, :id
    field :description, :string
    field :name, :string
    field :start_date, :naive_datetime
    field :duration, :integer
    field :end_date, :naive_datetime
    field :status, :integer
    field :moderator, :user, resolve: assoc(:moderator)
    field :objective, :objective, resolve: assoc(:objective)
    field :invitations, list_of(:invitation) do
      resolve(
        assoc(:invitations, fn invitations_query, _args, _context ->
          invitations_query
        end)
      )
    end
  end

  object :challenge_queries do
    @desc "Get all challenges"
    field :list_challenges, list_of(:challenge) do
      resolve(&Resolvers.ChallengesResolver.list_challenges/3)
    end
    @desc "Get a single challenge"
    field :get_challenge, :challenge do
      arg(:id, non_null(:id))

      resolve(&Resolvers.ChallengesResolver.get_challenge/3)
    end
  end

  object :challenge_mutations do
    @desc "Create a challenge"
    field :create_challenge, :challenge do
      arg(:name, :string)
      arg(:description, :string)
      arg(:start_date, non_null(:naive_datetime))
      arg(:end_date, :naive_datetime)
      arg(:status, non_null(:integer))
      arg(:moderator_id, non_null(:id))
      arg(:duration, non_null(:integer))

      resolve(&Resolvers.ChallengesResolver.create_challenge/3)
    end
    @desc "Create an invitation"
    field :create_invitation, :invitation do
      arg(:invitee_id, non_null(:id))
      arg(:status, non_null(:integer))
      arg(:challenge_id, non_null(:id))

      resolve(&Resolvers.ChallengesResolver.create_invitation/3)
    end
    @desc "Create an objective"
    field :create_objective, :objective do
      arg(:objective_type, non_null(:integer))
      arg(:result_type, non_null(:integer))
      arg(:challenge_id, non_null(:id))
      arg(:value, non_null(:integer))

      resolve(&Resolvers.ChallengesResolver.create_objective/3)
    end
    @desc "Update a challenge"
    field :update_challenge, :challenge do
      arg(:id, non_null(:id))
      arg(:name, :string)
      arg(:description, :string)
      arg(:start_date, non_null(:naive_datetime))
      arg(:end_date, :naive_datetime)
      arg(:status, non_null(:integer))
      arg(:moderator_id, non_null(:id))
      arg(:duration, non_null(:integer))

      resolve(&Resolvers.ChallengesResolver.update_challenge/3)
    end
    @desc "Update an invitation"
    field :update_invitation, :invitation do
      arg(:id, non_null(:id))
      arg(:invitee_id, non_null(:id))
      arg(:status, non_null(:integer))
      arg(:challenge_id, non_null(:id))
      arg(:response_id, :id)

      resolve(&Resolvers.ChallengesResolver.update_invitation/3)
    end
    @desc "Update an objective"
    field :update_objective, :objective do
      arg(:id, non_null(:id))
      arg(:objective_type, non_null(:integer))
      arg(:result_type, non_null(:integer))
      arg(:challenge_id, non_null(:id))
      arg(:value, non_null(:integer))

      resolve(&Resolvers.ChallengesResolver.update_objective/3)
    end
    @desc "Delete a challenge"
    field :delete_challenge, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.ChallengesResolver.delete_challenge/3)
    end
    @desc "Delete an invitation"
    field :delete_invitation, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.ChallengesResolver.delete_invitation/3)
    end
  end

  object :challenge_subscriptions do
    
  end

end