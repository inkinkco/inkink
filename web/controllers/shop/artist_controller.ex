defmodule Inkink.Shop.ArtistController do
  use Inkink.Web, :controller
  alias Inkink.{
    Artist,
    Artwork,
    Repo
  }

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def index(conn, _params) do
    random_artworks =
      Artwork
      |> order_by(fragment("RANDOM()"))
      |> where([a], not is_nil(a.image))

    artists =
      Artist
      |> Repo.all

    preload_limit = length(artists) * 3

    random_artwork_suppressed =
      random_artworks
      |> limit(^preload_limit)

    artists = Repo.preload(artists, artworks: random_artwork_suppressed)

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
