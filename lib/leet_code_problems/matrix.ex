defmodule LeetCodeProblems.Matrix do
  require Integer

  @spec diagonal_sum(mat :: [[integer]]) :: integer
  def diagonal_sum(mat) do
    n = length(mat) - 1

    {_index, solutions} =
      Enum.reduce(mat, {0, []}, fn array, {index, values} ->
        value_1 = Enum.at(array, index)
        value_2 = Enum.at(array, n - index)

        if Integer.is_even(n) and div(n, 2) == index do
          {index + 1, [value_1 | values]}
        else
          {index + 1, [value_1, value_2 | values]}
        end
      end)

    Enum.sum(solutions)
  end
end
