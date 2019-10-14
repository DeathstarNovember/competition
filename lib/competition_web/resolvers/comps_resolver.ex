defmodule CompetitionWeb.Resolvers.CompsResolver do
  alias Competition.Comps

  def list_comps(_parent, _args, _resolutions) do
    {:ok, Comps.list_comps()}
  end

  def create_comp(_parent, args, _resolutions) do
    args
    |> Comps.create_comp()
    |> case do
      {:ok, comp} ->
        {:ok, comp}

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