defmodule Inkink.Repo.Migrations.AddIdAndUniqueToArtist do
  use Ecto.Migration

  def change do
    create unique_index(:artists, [:username])
    alter table(:artists) do
      remove :id
      add :id, :binary_id
    end
  end
end
