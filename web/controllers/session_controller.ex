defmodule Inkink.SessionController do
  use Inkink.Web, :controller

  alias Inkink.User

  alias Authsense.Plug, as: Auth
  alias Authsense.Service, as: Authplug

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def new(conn, _params) do
    render(conn, "index.html", changeset: User.changeset(%User{}))
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate({email, password}) do
      {:ok, user} ->
        Authplug.put_current_user(user)
        conn |> redirect(to: admin_artist_path(conn, :index))
      {:error, error} ->
        Authplug.put_current_user(nil)
        render(conn, "index.html", changeset: User.changeset(%User{}))
    end
  end

  def delete(conn, _params) do
    Authplug.put_current_user(nil)
    redirect(conn, to: page_path(conn, :index))
  end
end
