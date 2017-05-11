defmodule Inkink.Repo.Migrations.ChangeEventIdType do
  use Ecto.Migration

  def change do
    alter table(:events) do
      remove :id
      add :id, :binary_id
    end
  end
end
