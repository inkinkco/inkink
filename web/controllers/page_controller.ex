defmodule Inkink.PageController do
  use Inkink.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
