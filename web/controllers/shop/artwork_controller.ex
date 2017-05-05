defmodule Inkink.Shop.ArtworkController do
  use Inkink.Web, :controller
  alias Inkink.{
    Artwork,
    Repo
  }

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def index(conn, _params) do
    artworks =
      Artwork
      |> where([a], not is_nil(a.image))
      |> order_by(fragment("RANDOM()"))
      |> Repo.all

    render conn, "index.html", artworks: artworks
  end

  def show(conn, %{"artwork_id" => id}) do
    artwork = Artwork
      |> Repo.get(id)
      |> Repo.preload(:artist)

    render conn, "show.html", artwork: artwork
  end
end
