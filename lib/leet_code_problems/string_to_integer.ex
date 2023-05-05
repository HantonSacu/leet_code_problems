defmodule LeetCodeProblems.StringToInteger do
  @spec atoi(s :: String.t()) :: integer
  def atoi(s) do
    {sign, number} =
      s
      |> String.trim()
      |> String.codepoints()
      |> Enum.map(&(&1 |> String.to_charlist() |> hd()))
      |> solver("+", [])

    number = if number == [], do: [48], else: number
    solution = List.to_string(number)
    min = :math.pow(-2, 31) |> trunc()
    max = (:math.pow(2, 31) - 1) |> trunc()

    String.to_integer(sign <> solution) |> max(min) |> min(max)
  end

  defp solver([], sign, solution), do: {sign, Enum.reverse(solution)}

  defp solver([head | _tail], sign, solution) when head == 46 or head == 44, do: {sign, solution}

  defp solver([head | tail], sign, solution) when head == 45 do
    cond do
      tail == [] -> {sign, Enum.reverse(solution)}
      solution != [] -> {sign, Enum.reverse(solution)}
      hd(tail) >= 48 and hd(tail) <= 57 -> solver(tail, "-", solution)
      true -> {sign, [48]}
    end
  end

  defp solver([head | tail], sign, solution) when head == 43 do
    cond do
      tail == [] -> {sign, Enum.reverse(solution)}
      solution != [] -> {sign, Enum.reverse(solution)}
      hd(tail) >= 48 and hd(tail) <= 57 -> solver(tail, "+", solution)
      true -> {sign, [48]}
    end
  end

  defp solver([head | tail], sign, solution) when head == 48 do
    cond do
      solution == [] -> solver(tail, sign, [head | solution])
      hd(solution) >= 48 and hd(solution) <= 57 -> solver(tail, sign, [head | solution])
      true -> solver(tail, sign, solution)
    end
  end

  defp solver([head | tail], sign, solution) when head >= 49 and head <= 57,
    do: solver(tail, sign, [head | solution])

  defp solver([_head | _tail], sign, []), do: {sign, [48]}

  defp solver([_head | tail], sign, solution) do
    cond do
      tail == [] -> {sign, Enum.reverse(solution)}
      hd(tail) >= 48 and hd(tail) <= 57 -> {sign, Enum.reverse(solution)}
      true -> solver(tail, sign, solution)
    end
  end
end
