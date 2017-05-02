defmodule Inkink.Repo.Migrations.AddImageToArtwork do
  use Ecto.Migration

  def change do
    alter table(:artworks) do
      add :image, :string
    end
  end
end
