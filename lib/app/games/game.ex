defmodule App.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset


  schema "games" do
    field :annotator, :string
    field :black, :string
    field :blackelo, :integer
    field :date, :date
    field :eco, :string
    field :event, :string
    field :opening, :string
    field :pgn, :string
    field :result, :string
    field :round, :string
    field :site, :string
    field :timecontrol, :string
    field :variant, :string
    field :white, :string
    field :whiteelo, :integer

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:white, :black, :whiteelo, :blackelo, :pgn, :result, :site, :event, :round, :date, :variant, :timecontrol, :eco, :opening, :annotator])
    |> validate_required([:white, :black, :pgn, :result])
  end
end
