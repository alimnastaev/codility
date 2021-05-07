defmodule OddOccurrencesInArray do
  def solution([head | tail] = list) do
    slice = Enum.slice(list, 0, 3)

    if head != List.last(slice), do: List.last(slice), else: solution(tail)
  end
end

# run this in terminal: elixir 2.\ Arrays/2..2_odd_occurrences_in_array.ex

{time, solution} = :timer.tc(fn -> OddOccurrencesInArray.solution([9, 3, 9, 3, 9, 7, 9]) end)

IO.puts("given: 9, 3, 9, 3, 9, 7, 9]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms")

{time, solution} = :timer.tc(fn -> OddOccurrencesInArray.solution([9, 3, 4, 3, 9, 3, 9]) end)

IO.puts("given: 9, 3, 4, 3, 9, 3, 9]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms")
