defmodule Inkink.Repo.Migrations.AddAvatarToArtist do
  use Ecto.Migration

  def change do
    alter table(:artists) do
      add :avatar, :string
    end
  end
end
