defmodule Gist.CodeGists.CodeGist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gists" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    belongs_to :user, Gist.Accounts.User
    has_many :comments, Gist.Comments.Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(code_gist, attrs) do
    code_gist
    |> cast(attrs, [:name, :description, :markup_text, :user_id])
    |> validate_required([:name, :description, :markup_text, :user_id])
  end
end
