defmodule LeetCodeProblems.Linex do
  @spec max_uncrossed_lines(nums1 :: [integer], nums2 :: [integer]) :: integer
  def max_uncrossed_lines(nums1, nums2) do
    # We could first caculate all possible pairs and then
    {pair_indexes, max} = Enum.zip(nums1, nums2) |> Enum.with_index() |> solver([], 0)
    # subtract for each crossed index
    subtract(pair_indexes, max)
  end

  defp subtract(pair_indexes, solution) do
    {pair_indexes, solution}
  end

  def solver([{{num, num}, index} | rest], pair_indexes, acc),
    do: solver(rest, [{index, index} | pair_indexes], acc + 1)

  def solver([{{num1, num2}, index} | rest], pair_indexes, acc) do
    case {find(num1, index, rest, :down), find(num2, index, rest, :up)} do
      {{}, {}} -> solver(rest, pair_indexes, acc)
      {{}, pair} -> solver(rest, [pair | pair_indexes], acc + 1)
      {pair, {}} -> solver(rest, [pair | pair_indexes], acc + 1)
      {pair1, pair2} -> solver(rest, [pair1, pair2 | pair_indexes], acc + 2)
    end
  end

  defp find(_num, _index, [], _direction), do: {}

  defp find(num, index, [{{_up_num, num}, down_index} | _rest], :down) do
    {index, down_index}
  end

  defp find(num, index, [{{num, _down_num}, up_index} | _rest], :up) do
    {up_index, index}
  end

  defp find(num, index, [_head | rest], direction), do: find(num, index, rest, direction)
end

#   1   4   5   3   2
#   I
#   1   3   7   2   4

#   4   2   1   5   3
#
#   5   3   1   4   6

# 0:
# 1:
# 2:
# 3:
# 4:
