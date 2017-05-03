defmodule Inkink.Artwork do
  use Inkink.Web, :model
  use Arc.Ecto.Schema

  schema "artworks" do
    field :image, Inkink.Image.Type
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :etsy_link, :string
    field :ebay_link, :string

    belongs_to :artist, Inkink.Artist

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :price, :etsy_link, :ebay_link])
    |> validate_required([:name, :description, :price])
  end

  def image_changeset(struct, params \\ %{}) do
    struct
    |> cast_attachments(params, [:image])
  end
end
