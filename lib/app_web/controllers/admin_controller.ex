defmodule AppWeb.AdminController do
  use AppWeb, :controller

  plug :put_layout, "admin.html"

  def index(conn, _params) do
    render(conn, "admin.html")
  end

  def new_game(conn, _params) do
    render(conn, "pgn.html")
  end

  def post_game(conn, %{"game" => game_params}) do
    game_params
    |> App.Pgn.Parser.parse_pgn
    |> Map.put("date", DateTime.utc_now)
    |> App.Games.create_game

    conn
    |> put_flash(:info, "Game sent successfully.")
    |> redirect(to: admin_path(conn, :index))  
  end

end