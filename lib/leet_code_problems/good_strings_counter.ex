defmodule LeetCodeProblems.GoodStringCounter do
  @spec count_good_strings(low :: integer, high :: integer, zero :: integer, one :: integer) ::
          integer
  def count_good_strings(low, high, zero, one) do
  end

  def permutations([]), do: [[]]

  def permutations(list),
    do: for(elem <- list, rest <- permutations(list -- [elem]), do: [elem | rest])
end
