defmodule PermMissingElem do
  def find_element_mathematical(list) do
    n = length(list) + 1

    result = div(n * (n + 1), 2)

    result - Enum.sum(list)
  end

  def find_element_naive1(list) do
    list
    |> Enum.sort()
    |> do_find1
  end

  defp do_find1([]), do: []

  defp do_find1([head | tail] = list) when is_list(list) do
    if (head + 1) not in tail, do: head + 1, else: do_find1(tail)
  end

  def find_element_naive2(list) do
    list
    |> Enum.sort()
    |> do_find2
  end

  def do_find2([head | tail]) when head + 1 != hd(tail), do: head + 1
  def do_find2([_head | tail]), do: do_find2(tail)
end

# find_element_mathematical ##############
{time, solution} = :timer.tc(fn -> PermMissingElem.find_element_mathematical([5, 2, 1, 3]) end)

IO.puts("For mathematical given: [5, 2, 1, 3]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")

{time, solution} =
  :timer.tc(fn -> PermMissingElem.find_element_mathematical([5, 2, 1, 3, 4, 9, 7, 8, 11, 6]) end)

IO.puts("For mathematical given: [5, 2, 1, 3, 4, 9, 7, 8, 11, 6]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")

# find_element_naive1 ##############
{time, solution} = :timer.tc(fn -> PermMissingElem.find_element_naive1([5, 2, 1, 3]) end)

IO.puts("For find_element_naive1 given: [5, 2, 1, 3]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")

{time, solution} =
  :timer.tc(fn -> PermMissingElem.find_element_naive1([5, 2, 1, 3, 4, 9, 7, 8, 11, 6]) end)

IO.puts("For find_element_naive1 given: [5, 2, 1, 3, 4, 9, 7, 8, 11, 6]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")

# find_element_naive2 ###############
{time, solution} = :timer.tc(fn -> PermMissingElem.find_element_naive2([5, 2, 1, 3]) end)

IO.puts("For find_element_naive2 given: [5, 2, 1, 3]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")

{time, solution} =
  :timer.tc(fn -> PermMissingElem.find_element_naive2([5, 2, 1, 3, 4, 9, 7, 8, 11, 6]) end)

IO.puts("For find_element_naive2 given: [5, 2, 1, 3, 4, 9, 7, 8, 11, 6]: output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms \n")
