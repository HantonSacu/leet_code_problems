defmodule LeetCodeProblems.SpiralMatrix do
  @spec order(matrix :: [[integer]]) :: [integer]
  def order(matrix), do: solver(matrix, [])
  defp solver([], solution), do: solution
  defp solver([row | rest], solution), do: solver(rotate(rest, []), solution ++ row)

  defp rotate([], solution), do: Enum.reverse(solution)

  defp rotate(list, solution) do
    {rest_of_list, new_row} =
      Enum.reduce(list, {[], []}, fn row, {new_list, acc} ->
        case Enum.split(row, -1) do
          {[], [last_element]} -> {new_list, [last_element | acc]}
          {rest_of_row, [last_element]} -> {[rest_of_row | new_list], [last_element | acc]}
        end
      end)

    rotate(Enum.reverse(rest_of_list), [Enum.reverse(new_row) | solution])
  end
end
