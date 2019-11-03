defmodule CompetitionWeb.Resolvers.EntriesResolver do
  alias Competition.Entries

  def list_entries(_parent, _args, _resolutions) do
    {:ok, Entries.list_entries()}
  end
  def get_entry(_parent, args, _resolutions) do
    args[:id]
    |> Entries.get_entry!()
    |> case do
      {:ok, entry} ->
        {:ok, entry}
      {:error, error} ->
        {:error, error}
    end
  end

  def create_entry(_parent, args, _resolutions) do
    args
    |> Entries.create_entry()
    |> case do
      {:ok, entry} ->
        {:ok, entry}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def like_entry(_parent, args, _resolutions) do
    args
    |> Entries.like_entry()
    |> case do
      {:ok, like} ->
        {:ok, like}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_entry(_parent, args, _resolutions) do
    Entries.get_entry!(args[:id])
    |> Entries.update_entry(args)
    |> case do
      {:ok, entry} ->
        {:ok, entry}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_entry(_parent, args, _resolutions) do
    args[:id]
    |> Entries.delete_entry()
    {:ok, :id}
  end
  
  def unlike_entry(_parent, args, _resolutions) do
    args[:id]
    |> Entries.unlike_entry()
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