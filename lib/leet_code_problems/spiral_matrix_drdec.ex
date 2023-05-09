defmodule LeetCodeProblems.SpiralMatrixDrdec do
  import Enum, only: [zip: 1, reverse: 1, map: 2]

  @spec spiral_order(matrix :: [[integer]]) :: [integer]
  def spiral_order([row]), do: row

  def spiral_order([row | tail]),
    do: row ++ (tail |> zip() |> reverse() |> map(&Tuple.to_list/1) |> spiral_order())
end
