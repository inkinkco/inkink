defmodule Inkink.Shop.PageView do
  use Inkink.Web, :view

  def avatar_url(%{avatar: nil}), do: "/images/artists/1.jpg"

  def avatar_url(artist) do
    url = Inkink.Avatar.url({artist.avatar, artist}, :original)
    case Mix.env do
      :dev -> Inkink.Endpoint.static_path(String.replace(url, "/priv/static", ""))
      _ -> String.replace(url, "uploads", "inkink-production/uploads", global: false)
    end
  end

  def image_url(%{image: nil}), do: "/images/artwork/1.jpg"

  def image_url(artwork) do
    url = Inkink.Image.url({artwork.image, artwork}, :original)
    case Mix.env do
      :dev -> Inkink.Endpoint.static_path(String.replace(url, "/priv/static", ""))
      _ -> String.replace(url, "uploads", "inkink-production/uploads", global: false)
    end
  end

  def banner_url(event, img_type) do
    url = Inkink.Banner.url({event.banner, event}, img_type)
    case Mix.env do
      :dev -> Inkink.Endpoint.static_path(String.replace(url, "/priv/static", ""))
      _ -> String.replace(url, "uploads", "inkink-production/uploads", global: false)
    end
  end
end
