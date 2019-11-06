defmodule Competition.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Competition.Repo

  alias Competition.Accounts.User
  alias Competition.Accounts.FollowLink

  @doc """
  Returns the list of users.
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the User does not exist.
  """
  def get_user!(id) do
    Repo.get!(User, id)
  end
  
  @doc """
  Gets a single FollowLink.
  Raises `Ecto.NoResultsError` if the User does not exist.
  """
  def get_follow_link!(id) do
    Repo.get!(FollowLink, id)
  end

  @doc """
  Creates a user.
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
  
  @doc """
  Creates a FollowLink.
  """
  def create_follow_link(attrs \\ %{}) do
    %FollowLink{}
    |> FollowLink.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.
  """
  def delete_user(id) do
    get_user!(id)
    |> Repo.delete()
  end
  
  @doc """
  Deletes a User.
  """
  def delete_follow_link(id) do
    get_follow_link!(id)
    |> Repo.delete()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
