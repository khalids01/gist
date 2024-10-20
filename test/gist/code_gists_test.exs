defmodule Gist.CodeGistsTest do
  use Gist.DataCase

  alias Gist.CodeGists

  describe "gists" do
    alias Gist.CodeGists.CodeGist

    import Gist.CodeGistsFixtures

    @invalid_attrs %{name: nil, description: nil, markup_text: nil}

    test "list_gists/0 returns all gists" do
      code_gist = code_gist_fixture()
      assert CodeGists.list_gists() == [code_gist]
    end

    test "get_code_gist!/1 returns the code_gist with given id" do
      code_gist = code_gist_fixture()
      assert CodeGists.get_code_gist!(code_gist.id) == code_gist
    end

    test "create_code_gist/1 with valid data creates a code_gist" do
      valid_attrs = %{name: "some name", description: "some description", markup_text: "some markup_text"}

      assert {:ok, %CodeGist{} = code_gist} = CodeGists.create_code_gist(valid_attrs)
      assert code_gist.name == "some name"
      assert code_gist.description == "some description"
      assert code_gist.markup_text == "some markup_text"
    end

    test "create_code_gist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CodeGists.create_code_gist(@invalid_attrs)
    end

    test "update_code_gist/2 with valid data updates the code_gist" do
      code_gist = code_gist_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", markup_text: "some updated markup_text"}

      assert {:ok, %CodeGist{} = code_gist} = CodeGists.update_code_gist(code_gist, update_attrs)
      assert code_gist.name == "some updated name"
      assert code_gist.description == "some updated description"
      assert code_gist.markup_text == "some updated markup_text"
    end

    test "update_code_gist/2 with invalid data returns error changeset" do
      code_gist = code_gist_fixture()
      assert {:error, %Ecto.Changeset{}} = CodeGists.update_code_gist(code_gist, @invalid_attrs)
      assert code_gist == CodeGists.get_code_gist!(code_gist.id)
    end

    test "delete_code_gist/1 deletes the code_gist" do
      code_gist = code_gist_fixture()
      assert {:ok, %CodeGist{}} = CodeGists.delete_code_gist(code_gist)
      assert_raise Ecto.NoResultsError, fn -> CodeGists.get_code_gist!(code_gist.id) end
    end

    test "change_code_gist/1 returns a code_gist changeset" do
      code_gist = code_gist_fixture()
      assert %Ecto.Changeset{} = CodeGists.change_code_gist(code_gist)
    end
  end

  describe "saved_gist" do
    alias Gist.CodeGists.SavedGist

    import Gist.CodeGistsFixtures

    @invalid_attrs %{}

    test "list_saved_gist/0 returns all saved_gist" do
      saved_gist = saved_gist_fixture()
      assert CodeGists.list_saved_gist() == [saved_gist]
    end

    test "get_saved_gist!/1 returns the saved_gist with given id" do
      saved_gist = saved_gist_fixture()
      assert CodeGists.get_saved_gist!(saved_gist.id) == saved_gist
    end

    test "create_saved_gist/1 with valid data creates a saved_gist" do
      valid_attrs = %{}

      assert {:ok, %SavedGist{} = saved_gist} = CodeGists.create_saved_gist(valid_attrs)
    end

    test "create_saved_gist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CodeGists.create_saved_gist(@invalid_attrs)
    end

    test "update_saved_gist/2 with valid data updates the saved_gist" do
      saved_gist = saved_gist_fixture()
      update_attrs = %{}

      assert {:ok, %SavedGist{} = saved_gist} = CodeGists.update_saved_gist(saved_gist, update_attrs)
    end

    test "update_saved_gist/2 with invalid data returns error changeset" do
      saved_gist = saved_gist_fixture()
      assert {:error, %Ecto.Changeset{}} = CodeGists.update_saved_gist(saved_gist, @invalid_attrs)
      assert saved_gist == CodeGists.get_saved_gist!(saved_gist.id)
    end

    test "delete_saved_gist/1 deletes the saved_gist" do
      saved_gist = saved_gist_fixture()
      assert {:ok, %SavedGist{}} = CodeGists.delete_saved_gist(saved_gist)
      assert_raise Ecto.NoResultsError, fn -> CodeGists.get_saved_gist!(saved_gist.id) end
    end

    test "change_saved_gist/1 returns a saved_gist changeset" do
      saved_gist = saved_gist_fixture()
      assert %Ecto.Changeset{} = CodeGists.change_saved_gist(saved_gist)
    end
  end
end
