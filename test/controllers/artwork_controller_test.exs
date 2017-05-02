defmodule Inkink.ArtworkControllerTest do
  use Inkink.ConnCase

  alias Inkink.Artwork
  @valid_attrs %{description: "some content", ebay_link: "some content", etsy_link: "some content", name: "some content", price: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artwork_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing artworks"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, artwork_path(conn, :new)
    assert html_response(conn, 200) =~ "New artwork"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, artwork_path(conn, :create), artwork: @valid_attrs
    assert redirected_to(conn) == artwork_path(conn, :index)
    assert Repo.get_by(Artwork, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artwork_path(conn, :create), artwork: @invalid_attrs
    assert html_response(conn, 200) =~ "New artwork"
  end

  test "shows chosen resource", %{conn: conn} do
    artwork = Repo.insert! %Artwork{}
    conn = get conn, artwork_path(conn, :show, artwork)
    assert html_response(conn, 200) =~ "Show artwork"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, artwork_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    artwork = Repo.insert! %Artwork{}
    conn = get conn, artwork_path(conn, :edit, artwork)
    assert html_response(conn, 200) =~ "Edit artwork"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    artwork = Repo.insert! %Artwork{}
    conn = put conn, artwork_path(conn, :update, artwork), artwork: @valid_attrs
    assert redirected_to(conn) == artwork_path(conn, :show, artwork)
    assert Repo.get_by(Artwork, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artwork = Repo.insert! %Artwork{}
    conn = put conn, artwork_path(conn, :update, artwork), artwork: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit artwork"
  end

  test "deletes chosen resource", %{conn: conn} do
    artwork = Repo.insert! %Artwork{}
    conn = delete conn, artwork_path(conn, :delete, artwork)
    assert redirected_to(conn) == artwork_path(conn, :index)
    refute Repo.get(Artwork, artwork.id)
  end
end
