defmodule LeetCodeProblems.ValidIndexedObstacles do
  @spec longest_course(obstacles :: [integer]) :: [integer]
  def longest_course(obstacles) do
    obstacles
    |> Enum.with_index()
    |> Enum.map(fn {_value, index} ->
      considered_obstacles = Enum.slice(obstacles, 0..index)
      IO.inspect(considered_obstacles, label: "CONSIDERED OBSTACLES")
      Enum.max_by(solver(considered_obstacles, []), &length/1)
    end)
    |> Enum.map(&length/1)
  end

  # solver gets list of considered elements
  # and constructs a list of longest courses (a list of lists)
  # for each head in order it will either
  # have head <= last(tail) and have a valid path or
  # have head > last(tail) which is an invalid path
  defp solver([], solutions), do: solutions

  defp solver([head | tail], solutions) do
    ith_element = Enum.at(tail, -1)

    if head <= ith_element,
      do: solver(tail, [find_solution(ith_element, tail, [head]) | solutions]),
      else: solver(tail, solutions)
  end

  defp find_solution(_ith_element, [], solution), do: solution |> IO.inspect(label: "SOLUTION")

  defp find_solution(ith_element, [head1 | tail1], [head2 | tail2])
       when head1 >= head2 and head1 <= ith_element,
       do: find_solution(ith_element, tail1, [head1, head2 | tail2])

  defp find_solution(ith_element, [_head1 | tail1], [head2 | tail2]),
    do: find_solution(ith_element, tail1, [head2 | tail2])
end
