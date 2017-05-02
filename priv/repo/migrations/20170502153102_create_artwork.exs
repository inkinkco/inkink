defmodule Inkink.Repo.Migrations.CreateArtwork do
  use Ecto.Migration

  def change do
    alter table(:artists) do
      modify :id, :binary_id, primary_key: true
    end

    create table(:artworks) do
      add :name, :string
      add :description, :string
      add :price, :decimal
      add :etsy_link, :string
      add :ebay_link, :string
      add :artist_id, references(:artists, on_delete: :nothing, type: :uuid)

      timestamps()
    end
    create index(:artworks, [:artist_id])

  end
end
