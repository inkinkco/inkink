defmodule Inkink.Repo.Migrations.ModifyArtworkId do
  use Ecto.Migration

  def change do
    alter table(:artworks) do
      remove :id
      add :id, :binary_id, primary_key: true
    end
  end
end
