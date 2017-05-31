defmodule Inkink.Repo.Migrations.AddStartAndEndToEvent do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :start, :utc_datetime
      add :end, :utc_datetime
    end
  end
end
