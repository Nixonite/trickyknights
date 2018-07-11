defmodule App.GamesTest do
  use App.DataCase

  alias App.Games

  describe "games" do
    alias App.Games.Game

    @valid_attrs %{annotator: "some annotator", black: "some black", blackelo: 42, date: ~D[2010-04-17], eco: "some eco", event: "some event", opening: "some opening", pgn: "some pgn", result: "some result", round: "some round", site: "some site", timecontrol: "some timecontrol", variant: "some variant", white: "some white", whiteelo: 42}
    @update_attrs %{annotator: "some updated annotator", black: "some updated black", blackelo: 43, date: ~D[2011-05-18], eco: "some updated eco", event: "some updated event", opening: "some updated opening", pgn: "some updated pgn", result: "some updated result", round: "some updated round", site: "some updated site", timecontrol: "some updated timecontrol", variant: "some updated variant", white: "some updated white", whiteelo: 43}
    @invalid_attrs %{annotator: nil, black: nil, blackelo: nil, date: nil, eco: nil, event: nil, opening: nil, pgn: nil, result: nil, round: nil, site: nil, timecontrol: nil, variant: nil, white: nil, whiteelo: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Games.create_game(@valid_attrs)
      assert game.annotator == "some annotator"
      assert game.black == "some black"
      assert game.blackelo == 42
      assert game.date == ~D[2010-04-17]
      assert game.eco == "some eco"
      assert game.event == "some event"
      assert game.opening == "some opening"
      assert game.pgn == "some pgn"
      assert game.result == "some result"
      assert game.round == "some round"
      assert game.site == "some site"
      assert game.timecontrol == "some timecontrol"
      assert game.variant == "some variant"
      assert game.white == "some white"
      assert game.whiteelo == 42
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, game} = Games.update_game(game, @update_attrs)
      assert %Game{} = game
      assert game.annotator == "some updated annotator"
      assert game.black == "some updated black"
      assert game.blackelo == 43
      assert game.date == ~D[2011-05-18]
      assert game.eco == "some updated eco"
      assert game.event == "some updated event"
      assert game.opening == "some updated opening"
      assert game.pgn == "some updated pgn"
      assert game.result == "some updated result"
      assert game.round == "some updated round"
      assert game.site == "some updated site"
      assert game.timecontrol == "some updated timecontrol"
      assert game.variant == "some updated variant"
      assert game.white == "some updated white"
      assert game.whiteelo == 43
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end
end
