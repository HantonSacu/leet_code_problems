defmodule LeetCodeProblems.LastWorder do
  @spec length_of_last_word(s :: String.t()) :: integer
  def length_of_last_word(s) do
    s
    |> String.trim()
    |> String.codepoints()
    |> Enum.reverse()
    |> solver(0)
  end

  defp solver([" " | _tail], acc), do: acc
  defp solver([_head | tail], acc), do: solver(tail, acc + 1)
end
