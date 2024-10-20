defmodule Gist.CodeGists.SavedGist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "saved_gist" do
    belongs_to :users, Gist.Accounts.User
    belongs_to :gists, Gist.CodeGists.CodeGist

    timestamps(type: :utc_datetime)
  end

  def changeset(saved_gist, attrs) do
    saved_gist
    |> cast(attrs, [:user_id, :gist_id])
    |> validate_required([:user_id, :gist_id])
  end
end
