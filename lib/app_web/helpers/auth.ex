defmodule AppWeb.Helpers.Auth do
  import Plug.Conn
  alias App.Accounts

  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !!App.Repo.get(App.Accounts.User, user_id)
  end

end