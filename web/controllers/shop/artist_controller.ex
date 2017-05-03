defmodule Inkink.Shop.ArtistController do
  use Inkink.Web, :controller
  alias Inkink.{
    Artist,
    Artwork,
    Repo
  }

  def index(conn, _params) do
    artists =
      Artist
      |> Repo.all
      |> Repo.preload(:artworks)
    render conn, "index.html", artists: artists
  end

  def show(conn, %{"artist_id" => id}) do
    artist =
      Artist
      |> Repo.get(id)
      |> Repo.preload(:artworks)

    render conn, "show.html", artist: artist
  end
end
