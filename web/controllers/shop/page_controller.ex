defmodule Inkink.Shop.PageController do
  use Inkink.Web, :controller

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  alias Inkink.{
    Artist,
    Artwork,
    Repo
  }

  def index(conn, _params) do
    artists =
    Artist
    |> order_by(fragment("RANDOM()"))
    |> limit(4)
    |> Repo.all

    artworks =
    Artwork
    |> order_by(fragment("RANDOM()"))
    |> limit(12)
    |> Repo.all

    render(conn, "index.html", artists: artists, artworks: artworks)
  end
end
