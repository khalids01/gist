defmodule Gist.CodeGists do
  @moduledoc """
  The CodeGists context.
  """

  import Ecto.Query, warn: false
  alias Gist.Repo

  alias Gist.CodeGists.CodeGist

  @doc """
  Returns the list of gists.

  ## Examples

      iex> list_gists()
      [%CodeGist{}, ...]

  """
  def list_gists do
    Repo.all(CodeGist)
  end

  @doc """
  Gets a single code_gist.

  Raises `Ecto.NoResultsError` if the Code gist does not exist.

  ## Examples

      iex> get_code_gist!(123)
      %CodeGist{}

      iex> get_code_gist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_code_gist!(id), do: Repo.get!(CodeGist, id)

  @doc """
  Creates a code_gist.

  ## Examples

      iex> create_code_gist(%{field: value})
      {:ok, %CodeGist{}}

      iex> create_code_gist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_code_gist(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:gists)
    |> CodeGist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a code_gist.

  ## Examples

      iex> update_code_gist(code_gist, %{field: new_value})
      {:ok, %CodeGist{}}

      iex> update_code_gist(code_gist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_code_gist(%CodeGist{} = code_gist, attrs) do
    code_gist
    |> CodeGist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a code_gist.

  ## Examples

      iex> delete_code_gist(code_gist)
      {:ok, %CodeGist{}}

      iex> delete_code_gist(code_gist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_code_gist(%CodeGist{} = code_gist) do
    Repo.delete(code_gist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking code_gist changes.

  ## Examples

      iex> change_code_gist(code_gist)
      %Ecto.Changeset{data: %CodeGist{}}

  """
  def change_code_gist(%CodeGist{} = code_gist, attrs \\ %{}) do
    CodeGist.changeset(code_gist, attrs)
  end

  alias Gist.CodeGists.SavedGist

  @doc """
  Returns the list of saved_gist.

  ## Examples

      iex> list_saved_gist()
      [%SavedGist{}, ...]

  """
  def list_saved_gist do
    Repo.all(SavedGist)
  end

  @doc """
  Gets a single saved_gist.

  Raises `Ecto.NoResultsError` if the Saved gist does not exist.

  ## Examples

      iex> get_saved_gist!(123)
      %SavedGist{}

      iex> get_saved_gist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saved_gist!(id), do: Repo.get!(SavedGist, id)

  @doc """
  Creates a saved_gist.

  ## Examples

      iex> create_saved_gist(%{field: value})
      {:ok, %SavedGist{}}

      iex> create_saved_gist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saved_gist(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:saved_gists)
    |> SavedGist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saved_gist.

  ## Examples

      iex> update_saved_gist(saved_gist, %{field: new_value})
      {:ok, %SavedGist{}}

      iex> update_saved_gist(saved_gist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saved_gist(%SavedGist{} = saved_gist, attrs) do
    saved_gist
    |> SavedGist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saved_gist.

  ## Examples

      iex> delete_saved_gist(saved_gist)
      {:ok, %SavedGist{}}

      iex> delete_saved_gist(saved_gist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saved_gist(%SavedGist{} = saved_gist) do
    Repo.delete(saved_gist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saved_gist changes.

  ## Examples

      iex> change_saved_gist(saved_gist)
      %Ecto.Changeset{data: %SavedGist{}}

  """
  def change_saved_gist(%SavedGist{} = saved_gist, attrs \\ %{}) do
    SavedGist.changeset(saved_gist, attrs)
  end
end
