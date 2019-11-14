defmodule CompetitionWeb.Resolvers.ChallengesResolver do
  alias Competition.Challenges
  
  def list_challenges(_parent, _args, _resolutions) do
    {:ok, Challenges.list_challenges()}
  end

  def get_challenge(_parent, args, _resolutions) do
    {:ok, Challenges.get_challenge!(args[:id])}
  end

  def create_invitation(_parent, args, _resolutions) do
    args
    |> Challenges.create_invitation()
    |> case do
      {:ok, invitation} ->
        {:ok, invitation}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def create_challenge(_parent, args, _resolutions) do
    args
    |> Challenges.create_challenge()
    |> case do
      {:ok, challenge} ->
        Challenges.create_invitation(
          %{invitee_id: challenge.moderator_id,
          challenge_id: challenge.id,
          status: 0}
        )
        Challenges.create_objective(
          %{
            objective_type: 0,
            result_type: 0,
            value: 0,
            challenge_id: challenge.id
          }
        )
        {:ok, challenge}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  
  
  def create_objective(_parent, args, _resolutions) do
    args
    |> Challenges.create_objective()
    |> case do
      {:ok, objective} ->
        {:ok, objective}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_challenge(_parent, args, _resolutions) do
    Challenges.get_challenge!(args[:id])
    |> Challenges.update_challenge(args)
    |> case do
      {:ok, challenge} ->
        {:ok, challenge}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_invitation(_parent, args, _resolutions) do
    Challenges.get_invitation!(args[:id])
    |> Challenges.update_invitation(args)
    |> case do
      {:ok, invitation} ->
        {:ok, invitation}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_objective(_parent, args, _resolutions) do
    Challenges.get_objective!(args[:id])
    |> Challenges.update_objective(args)
    |> case do
      {:ok, objective} ->
        {:ok, objective}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_challenge(_parent, args, _resolutions) do
    args[:id]
    |> Challenges.delete_challenge()
    {:ok, :id}
  end

  def delete_invitation(_parent, args, _resolutions) do
    args[:id]
    |> Challenges.delete_invitation()
    {:ok, :id}
  end


  defp extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end
end