defmodule Gist.CodeGistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gist.CodeGists` context.
  """

  @doc """
  Generate a code_gist.
  """
  def code_gist_fixture(attrs \\ %{}) do
    {:ok, code_gist} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> Gist.CodeGists.create_code_gist()

    code_gist
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> Gist.CodeGists.create_saved_gist()

    saved_gist
  end
end
