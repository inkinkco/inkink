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

  def show(conn, _params) do
    render conn, "show.html"
  end
end
