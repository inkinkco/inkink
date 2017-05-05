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
      |> where([a], not is_nil(a.image))
      |> order_by(fragment("RANDOM()"))
      |> limit(3)

    artists =
      Artist
      |> Repo.all
      |> Repo.preload(artworks: random_artworks)
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
