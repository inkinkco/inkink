defmodule Inkink.ArtistController do
  use Inkink.Web, :controller

  alias Inkink.Artist

  def index(conn, _params) do
    artists = Repo.all(Artist)
    render(conn, "index.html", artists: artists)
  end

  def new(conn, _params) do
    changeset = Artist.changeset(%Artist{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"artist" => artist_params}) do
    changeset = Artist.changeset(%Artist{}, artist_params)

    case Repo.insert(changeset) do
      {:ok, _artist} ->
        conn
        |> put_flash(:info, "Artist created successfully.")
        |> redirect(to: artist_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)
    render(conn, "show.html", artist: artist)
  end

  def edit(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)
    changeset = Artist.changeset(artist)
    render(conn, "edit.html", artist: artist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "artist" => artist_params}) do
    artist = Repo.get!(Artist, id)
    changeset = Artist.changeset(artist, artist_params)

    case Repo.update(changeset) do
      {:ok, artist} ->
        conn
        |> put_flash(:info, "Artist updated successfully.")
        |> redirect(to: artist_path(conn, :show, artist))
      {:error, changeset} ->
        render(conn, "edit.html", artist: artist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artist)

    conn
    |> put_flash(:info, "Artist deleted successfully.")
    |> redirect(to: artist_path(conn, :index))
  end
end
