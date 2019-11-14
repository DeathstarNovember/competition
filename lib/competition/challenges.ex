defmodule Competition.Challenges do
  @moduledoc """
  The Challenges context.
  """

  import Ecto.Query, warn: false
  alias Competition.Repo

  alias Competition.Challenges.Challenge
  alias Competition.Challenges.Objective
  alias Competition.Challenges.Invitation

  @doc """
  Returns the list of challenges.
  """
  def list_challenges do
    Repo.all(Challenge)
  end

  @doc """
  Gets a single challenge.
  Raises `Ecto.NoResultsError` if the Challenge does not exist.
  """
  def get_challenge!(id), do: Repo.get!(Challenge, id)
  
  @doc """
  Gets a single invitation.
  Raises `Ecto.NoResultsError` if the Challenge does not exist.
  """
  def get_invitation!(id), do: Repo.get!(Invitation, id)
  
  @doc """
  Gets a single objective.
  Raises `Ecto.NoResultsError` if the Challenge does not exist.
  """
  def get_objective!(id), do: Repo.get!(Objective, id)
  

  @doc """
  Creates a challenge.
  """
  def create_challenge(attrs \\ %{}) do
    %Challenge{}
    |> Challenge.changeset(attrs)
    |> Repo.insert()
  end
  
  @doc """
  Creates an invitation.
  """
  def create_invitation(attrs \\ %{}) do
    %Invitation{}
    |> Invitation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates an invitation.
  """
  def create_objective(attrs \\ %{}) do
    %Objective{}
    |> Objective.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a challenge.
  """
  def update_challenge(%Challenge{} = challenge, attrs) do
    challenge
    |> Challenge.changeset(attrs)
    |> Repo.update()
  end
  
  @doc """
  Updates an invitation.
  """
  def update_invitation(%Invitation{} = invitation, attrs) do
    invitation
    |> Invitation.changeset(attrs)
    |> Repo.update()
  end
  
  @doc """
  Updates an objective.
  """
  def update_objective(%Objective{} = objective, attrs) do
    objective
    |> Objective.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Challenge.
  """
  def delete_challenge(id) do
    get_challenge!(id)
    |> Repo.delete()
  end
  
  @doc """
  Deletes an Invitation.
  """
  def delete_invitation(id) do
    get_invitation!(id)
    |> Repo.delete()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking challenge changes.
  """
  def change_challenge(%Challenge{} = challenge) do
    Challenge.changeset(challenge, %{})
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invitation changes.
  """
  def change_inviation(%Invitation{} = invitation) do
    Invitation.changeset(invitation, %{})
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking objective changes.
  """
  def change_objective(%Objective{} = objective) do
    Objective.changeset(objective, %{})
  end
end


