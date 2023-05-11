defmodule LeetCodeProblems.Exponentor do
  @spec my_pow(x :: float, n :: integer) :: float
  def my_pow(x, n) do
    rem = rem(n, 2)
    n = n |> max(-1_000_000 - rem) |> min(1_000_000 + rem)
    solver(x, n, x)
  end

  defp solver(_x, _n, solution) when solution <= -10000, do: -10000
  defp solver(_x, _n, solution) when solution >= 10000, do: 10000
  defp solver(x, _n, solution) when solution > 0 and solution <= 0.000001, do: 0
  defp solver(x, 0, solution), do: solution / x
  defp solver(_x, 1, solution), do: solution
  defp solver(x, n, solution) when n < 0, do: solver(x, n + 1, solution / x)
  defp solver(x, n, solution), do: solver(x, n - 1, solution * x)
end
