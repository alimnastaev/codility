defmodule TapeEquilibrium do
  def run(list) do
    total_sum = sum(list)
    run(list, {0, total_sum, total_sum})
  end

  # BASE CASE
  defp run(list, {_, _, result}) when length(list) == 1, do: result

  defp run([head | tail], {left_sum, total_sum, acc}) do
    with {left_sum, result} <- count_result(left_sum, head, total_sum),
         acc <- accumulator(left_sum, total_sum, result, acc) do
      run(tail, acc)
    end
  end

  # Helpers
  defp count_result(left_sum, head, total_sum) do
    with left_sum <- left_sum + head,
         right_sum <- total_sum - left_sum,
         result <- max(left_sum, right_sum) - min(left_sum, right_sum) do
      {left_sum, result}
    end
  end

  defp accumulator(left_sum, total_sum, result, acc) when result < acc,
    do: {left_sum, total_sum, result}

  defp accumulator(left_sum, total_sum, _result, acc), do: {left_sum, total_sum, acc}

  defp sum(list), do: sum(list, 0)
  # BASE CASE
  defp sum([], acc), do: acc
  defp sum([head | tail], acc), do: sum(tail, acc + head)
end

{time, solution} = :timer.tc(fn -> TapeEquilibrium.run([3, 1, 2, 4, 3]) end)

IO.puts("Given: [3, 1, 2, 4, 3]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")

{time, solution} = :timer.tc(fn -> TapeEquilibrium.run([99, 1]) end)

IO.puts("Given: [99, 1]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")
