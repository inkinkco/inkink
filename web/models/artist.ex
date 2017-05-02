defmodule Inkink.Artist do
  use Inkink.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "artists" do
    field :name, :string
    field :state, :string
    field :country, :string
    field :description, :string
    field :username, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :state, :country, :description, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end
