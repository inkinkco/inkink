defmodule Inkink.SessionController do
  use Inkink.Web, :controller

  alias Inkink.User

  alias Authsense.Plug, as: Authplug
  alias Authsense.Service, as: Auth

  plug :put_layout, {Inkink.Shop.LayoutView, "app.html"}

  def new(conn, _params) do
    render(conn, "index.html", changeset: User.changeset(%User{}))
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Auth.authenticate({email, password}) do
      {:ok, user} ->
        conn
        |> Authplug.put_current_user(user)
        |> redirect(to: admin_artist_path(conn, :index))
      {:error, error} ->
        conn
        |> Authplug.put_current_user(nil)
        |> put_flash(:error, "Invalid login details.")
        |> render("index.html", changeset: User.changeset(%User{}))
    end
  end

  def delete(conn, _params) do
    conn
    |> Authplug.put_current_user(nil)
    |> put_flash(:info, "Successfully logged out.")
    |> redirect(to: session_path(conn, :index))
  end
end
