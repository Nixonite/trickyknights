defmodule AppWeb.PageController do
  use AppWeb, :controller
  alias App.Accounts

  plug :check_auth

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp check_auth(conn, _args) do
    if user_id = get_session(conn, :current_user_id) do
    current_user = Accounts.get_user!(user_id)
    
    conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to sign in")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end

end
