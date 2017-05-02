defmodule Inkink.Router do
  use Inkink.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :shop_layout do
    plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Inkink do
    pipe_through [:browser, :shop_layout]

    get "/", Shop.PageController, :index
    get "/artists", Shop.ArtistController, :index
    get "/artist/:artist_id", Shop.ArtistController, :show
  end

  scope "/admin", Inkink, as: :admin do
    pipe_through [:browser]

    resources "/artists", ArtistController do
      resources "/artworks", ArtworkController
    end
    resources "/artworks", ArtworkController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Inkink do
  #   pipe_through :api
  # end
end
