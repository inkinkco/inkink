defmodule Inkink.Shop.PageView do
  use Inkink.Web, :view

  def avatar_url(artist) do
    Inkink.Avatar.url({artist.avatar, artist}, :original)
    |> String.replace("/priv/static", "")
  end
end
