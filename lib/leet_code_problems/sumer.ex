defmodule LeetCodeProblems.Sumer do
  @spec find_two(nums :: [integer], target :: integer) :: [integer]
  def find_two(nums, target) do
    nums |> Enum.with_index() |> solver(target)
  end

  defp solver([{head, head_index} | tail], target) do
    case Enum.find(tail, fn {x, _index} ->
           x == target - head
         end) do
      nil -> solver(tail, target)
      {_x, index} -> [head_index, index]
    end
  end
end
