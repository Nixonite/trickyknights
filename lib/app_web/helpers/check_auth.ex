defmodule AppWeb.Helpers.CheckAuth do
  import Plug.Conn
  alias App.Accounts

  def init(_params) do
  end
  
  def call(conn, _args) do
    if user_id = Plug.Conn.get_session(conn, :current_user_id) do
    current_user = Accounts.get_user!(user_id)
    
    conn
      |> assign(:current_user, current_user)
    else
      conn
      |> Phoenix.Controller.put_flash(:error, "You need to sign in")
      |> Phoenix.Controller.redirect(to: AppWeb.Router.Helpers.page_path(conn, :index))
      |> Plug.Conn.halt()
    end
  end
end