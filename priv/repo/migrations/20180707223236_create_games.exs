defmodule App.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :white, :string
      add :black, :string
      add :whiteelo, :integer
      add :blackelo, :integer
      add :pgn, :string
      add :result, :string
      add :site, :string
      add :event, :string
      add :round, :string
      add :date, :date
      add :variant, :string
      add :timecontrol, :string
      add :eco, :string
      add :opening, :string
      add :annotator, :string

      timestamps()
    end

  end
end
