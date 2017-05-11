defmodule Inkink.Event do
  use Inkink.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "events" do
    field :title, :string
    field :text, :string
    field :banner, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :text, :banner])
    |> validate_required([:title, :text, :banner])
  end
end
