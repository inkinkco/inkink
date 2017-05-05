defmodule Inkink.Shop.PageController do
  use Inkink.Web, :controller

  alias Inkink.{
    Artist,
    Artwork,
    Repo
  }

  def index(conn, _params) do
    artists =
    Artist
    |> where([a], not is_nil(a.avatar))
    |> order_by(fragment("RANDOM()"))
    |> limit(4)
    |> Repo.all

    artworks =
    Artwork
    |> where([a], not is_nil(a.image))
    |> order_by(fragment("RANDOM()"))
    |> limit(12)
    |> Repo.all

    render(conn, "index.html", artists: artists, artworks: artworks)
  end
end
