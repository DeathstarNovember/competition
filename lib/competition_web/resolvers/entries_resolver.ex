defmodule CompetitionWeb.Resolvers.EntriesResolver do
  alias Competition.Entries

  def list_Entries(_parent, _args, _resolutions) do
    {:ok, Entries.list_entries()}
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