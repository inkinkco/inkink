defmodule Inkink.ArtworkController do
  use Inkink.Web, :controller

  alias Inkink.{
    Artist,
    Artwork
  }

  def index(conn, %{"artist_id" => artist_id}) do
    artist =
      Artist
      |> Repo.get(artist_id)
      |> Repo.preload(:artworks)
    render(conn, "index.html", artworks: artist.artworks, artist: artist)
  end

  def new(conn, %{"artist_id" => artist_id}) do
    artist = Repo.get(Artist, artist_id)
    changeset = Artwork.changeset(%Artwork{})
    render(conn, "new.html", changeset: changeset, artist: artist)
  end

  def create(conn, %{"artwork" => artwork_params, "artist_id" => artist_id}) do
    artist =
      Artist
      |> Repo.get(artist_id)
      |> Repo.preload(:artworks)

    changeset =
      Artwork.changeset(%Artwork{}, artwork_params)
      |> Map.get(:changes)

    changes = build_assoc(artist, :artworks, changeset)

    case Repo.insert(changes) do
      {:ok, artwork} ->
        conn
        |> put_flash(:info, "Artwork created successfully.")
        |> redirect(to: admin_artist_artwork_path(conn, :index, artist, artwork))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id, "artist_id" => artist_id}) do
    artist = Repo.get(Artist, artist_id)
    artwork = Repo.get!(Artwork, id)
    render(conn, "show.html", artwork: artwork, artist: artist)
  end

  def edit(conn, %{"id" => id, "artist_id" => artist_id}) do
    artwork = Repo.get!(Artwork, id)
    artist = Repo.get!(Artist, artist_id)
    changeset = Artwork.changeset(artwork)

    render(conn, "edit.html", artwork: artwork, changeset: changeset, artist: artist)
  end

  def update(conn, %{"id" => id, "artwork" => artwork_params, "artist_id" => artist_id}) do
    artist = Repo.get!(Artist, artist_id)
    artwork = Repo.get!(Artwork, id)
    changeset = Artwork.changeset(artwork, artwork_params)

    case Repo.update(changeset) do
      {:ok, artwork} ->
        conn
        |> put_flash(:info, "Artwork updated successfully.")
        |> redirect(to: admin_artist_artwork_path(conn, :show, artist, artwork))
      {:error, changeset} ->
        render(conn, "edit.html", artwork: artwork, changeset: changeset, artist: artist)
    end
  end

  def delete(conn, %{"id" => id, "artist_id" => artist_id}) do
    artist = Repo.get!(Artist, artist_id)
    artwork = Repo.get!(Artwork, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artwork)

    conn
    |> put_flash(:info, "Artwork deleted successfully.")
    |> redirect(to: admin_artist_artwork_path(conn, :index, artist))
  end
end
