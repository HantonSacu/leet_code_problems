defmodule LeetCodeProblems.ParenthesesGenerator do
  @spec generate(n :: integer()) :: [String.t()]
  def generate(n) do
    solutions = solve(1, n, [["(", ")"]])

    Enum.map(solutions, fn solution ->
      Enum.reduce(solution, "", &(&2 <> &1))
    end)
  end

  defp solve(n, n, solutions), do: solutions

  defp solve(i, n, solutions) do
    new_solutions =
      solutions
      |> Enum.reduce([], fn solution, acc ->
        new_solutions =
          [
            ["(", ")" | solution],
            solution ++ ["(", ")"],
            wrap(solution)
          ] ++ add_in_middle(solution)

        new_solutions ++ acc
      end)
      |> Enum.uniq()

    solve(i + 1, n, new_solutions)
  end

  defp add_in_middle(solution) do
    Enum.to_list(0..div(length(solution), 2))
    |> Enum.reverse()
    |> Enum.map(fn i ->
      index = i * 2 - 1
      a = List.insert_at(solution, index, "(")
      List.insert_at(a, index, ")")
    end)
  end

  defp wrap(solution) do
    solution
    |> List.insert_at(0, "(")
    |> List.insert_at(-1, ")")
  end
end
