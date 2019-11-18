defmodule Competition.Entries do
  @moduledoc """
  The Entries context.
  """

  require Logger
  import Ecto.Query, warn: false
  alias Competition.Repo

  alias Competition.Entries.Entry
  alias Competition.Entries.Like
  alias Competition.Entries.Comment
  alias Competition.Entries.Achievement

  @doc """
  Returns the list of entries.
  """
  def list_entries do
    Repo.all(Entry)
  end
  @doc """
  Returns the list of achievements.
  """
  def list_achievements do
    Repo.all(Achievement)
  end

  @doc """
  Gets a single entry.
  Raises `Ecto.NoResultsError` if the Entry does not exist.
  """
  def get_entry!(id), do: Repo.get!(Entry, id)
  
  @doc """
  Gets a single like.
  Raises `Ecto.NoResultsError` if the Entry does not exist.
  """
  def get_like!(id), do: Repo.get!(Like, id)
  
  @doc """
  Gets a single comment.
  Raises `Ecto.NoResultsError` if the Entry does not exist.
  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Creates an entry.
  """
  def create_entry(attrs \\ %{}) do
    %Entry{}
    |> Entry.changeset(attrs)
    |> Repo.insert()
  end
  
  @doc """
  Creates an achievement.
  """
  def create_achievement(attrs \\ %{}) do
    %Achievement{}
    |> Achievement.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Likes an entry.
  """

  def like_entry(attrs \\ %{}) do
    %Like{}
    |> Like.changeset(attrs)
    |> Repo.insert()
  end
  
  @doc """
  Comments on an entry.
  """

  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end
  
  @doc """
  Removes an entry_like.
  """

  def unlike_entry(id) do
    get_like!(id)
    |> Repo.delete()
  end
  
  @doc """
  Removes a comment.
  """

  def delete_comment(id) do
    get_comment!(id)
    |> Repo.delete()
  end

  @doc """
  Updates an entry.
  """
  def update_entry(%Entry{} = entry, attrs) do
    entry
    |> Entry.changeset(attrs)
    |> Repo.update()
  end
 
  @doc """
  Updates a comment.
  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes an Entry.
  """
  def delete_entry(id) do
    get_entry!(id)
    |> Repo.delete()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking entry changes.
  """
  def change_entry(%Entry{} = entry) do
    Entry.changeset(entry, %{})
  end
  @doc """
  Returns an `%Ecto.Changeset{}` for tracking like changes.
  """
  def change_like(%Like{} = like) do
    Like.changeset(like, %{})
  end
  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.
  """
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end
end
