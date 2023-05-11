defmodule LeetCodeProblems.RomanNumbers do
  @spec to_integer(s :: String.t()) :: integer
  def to_integer(s) do
    s |> String.codepoints() |> solver(0)
  end

  defp solver([], solution), do: solution

  defp solver(["I", head | rest], solution) do
    cond do
      head == "V" -> solver(rest, solution + 4)
      head == "X" -> solver(rest, solution + 9)
      true -> solver([head | rest], solution + 1)
    end
  end

  defp solver(["X", head | rest], solution) do
    cond do
      head == "L" -> solver(rest, solution + 40)
      head == "C" -> solver(rest, solution + 90)
      true -> solver([head | rest], solution + 10)
    end
  end

  defp solver(["C", head | rest], solution) do
    cond do
      head == "D" -> solver(rest, solution + 400)
      head == "M" -> solver(rest, solution + 900)
      true -> solver([head | rest], solution + 100)
    end
  end

  defp solver(["I" | rest], solution), do: solver(rest, solution + 1)
  defp solver(["V" | rest], solution), do: solver(rest, solution + 5)
  defp solver(["X" | rest], solution), do: solver(rest, solution + 10)
  defp solver(["L" | rest], solution), do: solver(rest, solution + 50)
  defp solver(["C" | rest], solution), do: solver(rest, solution + 100)
  defp solver(["D" | rest], solution), do: solver(rest, solution + 500)
  defp solver(["M" | rest], solution), do: solver(rest, solution + 1000)
end
