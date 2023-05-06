defmodule LeetCodeProblems.PalindromeNumber do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    x = x |> Integer.to_string() |> String.to_charlist()
    x == Enum.reverse(x)
  end
end
