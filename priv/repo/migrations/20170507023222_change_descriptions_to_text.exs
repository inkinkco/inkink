defmodule Inkink.Repo.Migrations.ChangeDescriptionsToText do
  use Ecto.Migration

  def change do
    alter table(:artworks) do
      modify :description, :text
    end

    alter table(:artists) do
      modify :description, :text
    end
  end
end
