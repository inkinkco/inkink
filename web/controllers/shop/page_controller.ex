defmodule Inkink.Shop.PageController do
  use Inkink.Web, :controller

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  alias Inkink.{
    Artist,
    Artwork,
    Event,
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

    events =
    Event
    |> order_by(:inserted_at)
    |> limit(4)
    |> Repo.all

    hero = get_hero(events)

    render(conn, "index.html", artists: artists, artworks: artworks, events: events, hero: hero)
  end

  defp get_hero([]), do: nil
  defp get_hero(events) when is_list(events), do: hd(events)
end
