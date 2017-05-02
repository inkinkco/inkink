defmodule Inkink.Artist do
  use Inkink.Web, :model
  use Arc.Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "artists" do
    field :avatar, Inkink.Avatar.Type
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
    |> cast_attachments(params, [:avatar])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end

  def avatar_changeset(struct, params \\ %{}) do
    struct |> cast_attachments(params, [:avatar])
  end
end
