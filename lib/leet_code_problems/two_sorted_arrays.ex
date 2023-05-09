defmodule LeetCodeProblems.TwoSortedArrays do
  @spec median(nums1 :: [integer], nums2 :: [integer]) :: float
  def median(nums1, nums2) do
    merged_array = merge(nums1, nums2, [])
    length = length(merged_array) - 1
    {index, delta} = {div(length, 2), rem(length, 2)}
    (Enum.at(merged_array, index) + Enum.at(merged_array, index + delta)) / 2
  end

  defp merge([], [], solution), do: solution
  defp merge([], rest, solution), do: Enum.reverse(rest) ++ solution
  defp merge(rest, [], solution), do: Enum.reverse(rest) ++ solution

  defp merge([head1 | tail1], [head2 | tail2], solution) when head1 < head2 do
    merge(tail1, [head2 | tail2], [head1 | solution])
  end

  defp merge([head1 | tail1], [head2 | tail2], solution) do
    merge([head1 | tail1], tail2, [head2 | solution])
  end
end
