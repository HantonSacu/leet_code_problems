defmodule LeetCodeProblems.Prefixer do
  @spec longest_common(strs :: [String.t()]) :: String.t()
  def longest_common(strs) do
    # strs = ["flower","flow","flight"] => "fl"
    list = Enum.map(strs, &String.to_charlist(&1))

    solution =
      case list do
        [head] ->
          head

        [head | tail] ->
          Enum.reduce(tail, head, fn s, acc ->
            solver(s, acc, []) |> Enum.reverse()
          end)
      end

    List.to_string(solution)
  end

  defp solver([head1 | tail1], [head2 | tail2], solution) when head1 == head2,
    do: solver(tail1, tail2, [head1 | solution])

  defp solver(_list1, _list2, solution), do: solution
end
