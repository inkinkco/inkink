defmodule Inkink.Artist do
  use Inkink.Web, :model

  schema "artists" do
    field :name, :string
    field :state, :string
    field :country, :string
    field :description, :string
    field :username, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :state, :country, :description, :username])
    |> validate_required([:name, :state, :country, :description, :username])
  end
end
