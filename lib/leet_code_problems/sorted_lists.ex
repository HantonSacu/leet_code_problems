defmodule LeetCodeProblems.ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule LeetCodeProblems.SortedLists do
  # Definition for singly-linked list.
  #

  # The following arguments were given to Solution.solver/3:
  # # 1
  # %ListNode{next: %ListNode{next: %ListNode{next: nil, val: 4}, val: 2}, val: 1}
  # # 2
  # %ListNode{next: %ListNode{next: %ListNode{next: nil, val: 4}, val: 3}, val: 1}
  # # 3
  # []

  alias LeetCodeProblems.ListNode

  @spec merge(list1 :: ListNode.t() | nil, list2 :: ListNode.t() | nil) ::
          ListNode.t() | nil
  def merge(list1, list2) do
    solver(list1, list2, [])
  end

  defp solver(nil, nil, solution), do: solution |> Enum.reverse() |> to_map()

  defp solver(%ListNode{next: next_node, val: val}, nil, solution),
    do: solver(next_node, nil, [val | solution])

  defp solver(nil, %ListNode{next: next_node, val: val}, solution),
    do: solver(nil, next_node, [val | solution])

  defp solver(%ListNode{next: next, val: val}, %ListNode{next: _, val: bigger} = node, solution)
       when val <= bigger,
       do: solver(next, node, [val | solution])

  defp solver(%ListNode{next: _, val: _} = node, %ListNode{next: next_node, val: val}, solution),
    do: solver(node, next_node, [val | solution])

  defp to_map([]), do: nil

  defp to_map([head | rest]) do
    %ListNode{next: to_map(rest), val: head}
  end
end
