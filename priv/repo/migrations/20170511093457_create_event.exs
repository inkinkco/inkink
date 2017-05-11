defmodule Inkink.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :text, :text
      add :banner, :string

      timestamps()
    end

  end
end
