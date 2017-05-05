defmodule Inkink.Authenticate do
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import Plug.Conn, only: [halt: 1]

  def ensure_authenticated(conn, _params) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to do that")
      |> redirect(to: Inkink.Router.Helpers.page_path(conn, :index))
      |> halt()
    end
  end
end
