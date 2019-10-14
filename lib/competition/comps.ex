defmodule Competition.Comps do
  @moduledoc """
  The Comps context.
  """

  import Ecto.Query, warn: false
  alias Competition.Repo

  alias Competition.Comps.Comp

  @doc """
  Returns the list of comps.

  ## Examples

      iex> list_comps()
      [%Comp{}, ...]

  """
  def list_comps do
    Repo.all(Comp)
  end

  @doc """
  Gets a single comp.

  Raises `Ecto.NoResultsError` if the Comp does not exist.

  ## Examples

      iex> get_comp!(123)
      %Comp{}

      iex> get_comp!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comp!(id), do: Repo.get!(Comp, id)

  @doc """
  Creates a comp.

  ## Examples

      iex> create_comp(%{field: value})
      {:ok, %Comp{}}

      iex> create_comp(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comp(attrs \\ %{}) do
    %Comp{}
    |> Comp.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comp.

  ## Examples

      iex> update_comp(comp, %{field: new_value})
      {:ok, %Comp{}}

      iex> update_comp(comp, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comp(%Comp{} = comp, attrs) do
    comp
    |> Comp.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Comp.

  ## Examples

      iex> delete_comp(comp)
      {:ok, %Comp{}}

      iex> delete_comp(comp)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comp(%Comp{} = comp) do
    Repo.delete(comp)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comp changes.

  ## Examples

      iex> change_comp(comp)
      %Ecto.Changeset{source: %Comp{}}

  """
  def change_comp(%Comp{} = comp) do
    Comp.changeset(comp, %{})
  end
end
