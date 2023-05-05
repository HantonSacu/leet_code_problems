defmodule LeetCodeProblems.Dota2 do
  @spec predict_party_victory(senate :: String.t()) :: String.t()
  def predict_party_victory(senate) do
    senate
    |> String.graphemes()
    |> solver()
  end

  defp solver(["R" | tail]) do
    case List.delete(tail, "D") do
      [] ->
        "Radiant"

      rest ->
        if Enum.all?(rest, &(&1 == "R")), do: "Radiant", else: solver(rest ++ ["R"])
    end
  end

  defp solver(["D" | tail]) do
    case List.delete(tail, "R") do
      [] ->
        "Dire"

      rest ->
        if Enum.all?(rest, &(&1 == "D")), do: "Dire", else: solver(rest ++ ["D"])
    end
  end
end
