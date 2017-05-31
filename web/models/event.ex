defmodule Inkink.Event do
  use Inkink.Web, :model
  use Arc.Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "events" do
    field :title, :string
    field :text, :string
    field :banner, Inkink.Banner.Type
    field :start, Timex.Ecto.DateTime
    field :end, Timex.Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :text, :start, :end])
    |> validate_required([:title, :text, :start, :end])
  end

  def banner_changeset(struct, params \\ %{}) do
    struct
    |> cast_attachments(params, [:banner])
  end
end
