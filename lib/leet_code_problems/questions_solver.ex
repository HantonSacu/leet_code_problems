defmodule LeetCodeProblems.QuestionsSolver do
  @spec most_points(questions :: [[integer]]) :: integer
  def most_points(questions), do: Enum.max(solver(questions) |> IO.inspect())

  defp solver([]), do: []

  defp solver([[points, brainpower] | rest]),
    do: [calculation(rest, brainpower, points) | solver(rest)]

  defp calculation([], _brainpower, solution), do: solution

  defp calculation([_head | tail], brainpower, solution) when brainpower > 0,
    do: calculation(tail, brainpower - 1, solution)

  defp calculation([[points, brainpower] | tail], 0, solution) do
    calculation(tail, brainpower, solution + points)
  end
end
