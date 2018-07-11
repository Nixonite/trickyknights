defmodule App.Repo.Migrations.VarcharsToTextmodifyChange do
  use Ecto.Migration

  def change do
    alter table("games") do
      modify :annotator, :text
      modify :black, :text
      modify :eco, :text
      modify :event, :text
      modify :opening, :text
      modify :pgn, :text
      modify :result, :text
      modify :round, :text
      modify :site, :text
      modify :timecontrol, :text
      modify :variant, :text
      modify :white, :text
    end

    alter table("posts") do
      modify :body, :text
    end
  end


end
