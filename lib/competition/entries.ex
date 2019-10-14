defmodule Competition.Entries do
  @moduledoc """
  The Entries context.
  """

  import Ecto.Query, warn: false
  alias Competition.Repo

  alias Competition.Entries.Entry

  @doc """
  Returns the list of entries.
  """
  def list_enrtries do
    Repo.all(Entry)
  end

  @doc """
  Gets a single entry.
  Raises `Ecto.NoResultsError` if the Entry does not exist.
  """
  def get_entry!(id), do: Repo.get!(Entry, id)

  @doc """
  Creates an entry.
  """
  def create_entry(attrs \\ %{}) do
    %Entry{}
    |> Entry.changeset(attrs)
    |> Repo.insert()
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
  Deletes an Entry.
  """
  def delete_entry(%Entry{} = entry) do
    Repo.delete(entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking entry changes.
  """
  def change_entry(%Entry{} = entry) do
    Entry.changeset(entry, %{})
  end
end
