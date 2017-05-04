defmodule Inkink.SessionController do
  use Inkink.Web, :controller

  alias Inkink.User

  alias Authsense.Plug, as: Auth
  alias Authsense.Service, as: Authplug

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def new(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate({email, password}) do
      {:ok, user} ->
        Authplug.put_current_user(user)
      {:error, error} ->
        Authplug.put_current_user(nil)
    end
  end

  def delete(conn, _params) do
    Authplug.put_current_user(nil)
  end
end
