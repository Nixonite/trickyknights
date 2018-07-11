defmodule App.Pgn.Parser do

  @white ~r/^\[White \"(?<white>.+)\"\].*$/m
  @black ~r/^\[Black \"(?<black>.+)\"\].*$/m
  @whiteElo ~r/^\[WhiteElo \"(?<whiteelo>\d+)\"\].*$/m
  @blackElo ~r/^\[BlackElo \"(?<blackelo>\d+)\"\].*$/m
  @variant ~r/^\[Variant \"(?<variant>.+)\"\].*$/m
  @timeControl ~r/^\[TimeControl \"(?<timecontrol>\d.+)\"\].*$/m
  @eco ~r/^\[ECO \"(?<eco>.+)\"\].*$/m
  @result ~r/^\[Result \"(?<result>\d.+)\"\].*$/m
  @site ~r/^\[Site \"(?<site>.+)\"\].*$/m
  @event ~r/^\[Event \"(?<event>.+)\"\].*$/m
  @date ~r/^\[UTCDate \"(?<date>.+)\"\].*$/m
  @opening ~r/^\[Opening \"(?<opening>.+)\"\].*$/m
  @round ~r/^\[Round \"(?<round>.+)\"\].*$/m
  @pgn ~r/^(?<pgn>1\..+)$/ms
  @annotator ~r/^\[Annotator \"(?<annotator>.+)\"\].*$/m

  def clean_and_split_pgn(pgn_text) do
    pgn_text
    |> String.split("\n", trim: true)
    |> Enum.map(fn(x) -> String.trim(x) end)
  end

  def parse_pgn(pgn_text) do
    pgn_text
    |> capture_regex_from_pgn
  end

  defp capture_regex_from_pgn(pgn_text) do
    [
      @white,
      @black,
      @whiteElo,
      @blackElo,
      @variant,
      @timeControl,
      @eco,
      @result,
      @site,
      @event,
      @date,
      @opening,
      @round,
      @pgn,
      @annotator
    ]
    |> Enum.map(fn(t) -> Regex.named_captures(t, String.trim(pgn_text)) end)
    |> Enum.filter(& &1) # filter nil values out
    |> Enum.flat_map(&Map.to_list/1)
    |> Map.new
  end

end