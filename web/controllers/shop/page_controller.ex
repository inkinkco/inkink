defmodule Inkink.Shop.PageController do
  use Inkink.Web, :controller

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def index(conn, _params) do
    render conn, "index.html"
  end
end
