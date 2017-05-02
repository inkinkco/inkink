defmodule Inkink.ArtistTest do
  use Inkink.ModelCase

  alias Inkink.Artist

  @valid_attrs %{country: "some content", description: "some content", name: "some content", state: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end
end
