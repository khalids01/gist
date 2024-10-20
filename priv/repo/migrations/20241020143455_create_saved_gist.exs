defmodule Gist.Repo.Migrations.CreateSavedGist do
  use Ecto.Migration

  def change do
    create table(:saved_gist) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :gist_id, references(:gists, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:saved_gist, [:user_id])
    create index(:saved_gist, [:gist_id])
  end
end
