defmodule LeetCodeProblems.Searcher do
  @spec search_insert(nums :: [integer], target :: integer) :: integer
  def search_insert(nums, target) do
    solver(nums, target, 0)
  end

  defp solver([], _num, solution), do: solution
  defp solver([num1 | rest], num, solution) when num1 < num, do: solver(rest, num, solution + 1)
  defp solver(_list, _num, solution), do: solution
end
