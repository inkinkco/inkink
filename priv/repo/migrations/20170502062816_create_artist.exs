defmodule Inkink.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :state, :string
      add :country, :string
      add :description, :string
      add :username, :string

      timestamps()
    end

  end
end
