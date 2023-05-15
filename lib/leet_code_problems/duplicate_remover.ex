defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule LeetCodeProblems.DuplicateRemover do
  @spec delete_duplicates(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def delete_duplicates(nil), do: nil

  def delete_duplicates(head) do
    %ListNode{val: head.val, next: solver(head.val, head.next)}
  end

  defp solver(val, %ListNode{val: val, next: next}), do: solver(val, next)

  defp solver(_, %ListNode{val: val, next: next}),
    do: %ListNode{val: val, next: solver(val, next)}

  defp solver(_val, node), do: node
end
