defmodule Inkink.User do
  use Inkink.Web, :model

  schema "users" do
    field :email, :string
    field :hashed_password, :string

    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> Authsense.Service.generate_hashed_password()
    |> validate_required([:email])
  end
end
