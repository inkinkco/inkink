defmodule Inkink.Shop.EventController do
  use Inkink.Web, :controller
  alias Inkink.{
    Event,
    Repo
  }

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def index(conn, _params) do
    events = Event |> Repo.all
    render conn, "index.html", event: events
  end

  def show(conn, %{"event_id" => id}) do
    event = Event |> Repo.get(id)
    render conn, "show.html", event: event
  end
end
