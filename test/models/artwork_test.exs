defmodule Inkink.ArtworkTest do
  use Inkink.ModelCase

  alias Inkink.Artwork

  @valid_attrs %{description: "some content", ebay_link: "some content", etsy_link: "some content", name: "some content", price: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artwork.changeset(%Artwork{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artwork.changeset(%Artwork{}, @invalid_attrs)
    refute changeset.valid?
  end
end
