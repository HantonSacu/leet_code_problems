defmodule LeetCodeProblems.Parenthesex do
  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s), do: solver(String.codepoints(s), [])

  defp solver([], []), do: true
  defp solver([], _acc), do: false
  defp solver([")" | tail], ["(" | acc]), do: solver(tail, acc)
  defp solver(["]" | tail], ["[" | acc]), do: solver(tail, acc)
  defp solver(["}" | tail], ["{" | acc]), do: solver(tail, acc)
  defp solver([head | tail], acc) when head in ["(", "[", "{"], do: solver(tail, [head | acc])
  defp solver(_, _acc), do: false
end
