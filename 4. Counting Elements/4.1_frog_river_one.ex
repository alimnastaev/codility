defmodule FrogRiverOne do
  def solution(x, a) do
    # Enum.with_index() - returns the enumerable with each element wrapped in a tuple alongside its index
    # iex> [1, 3, 1, 4, 2, 3, 5, 4] |> Enum.with_index()
    # iex> [{1, 0}, {3, 1}, {1, 2}, {4, 3}, {2, 4}, {3, 5}, {5, 6}, {4, 7}]

    # Enum.reduce_while() - reduces enumerable until fun returns {:halt, term}: where term is number == x

    Enum.with_index(a)
    |> Enum.reduce_while(0, fn {number, index}, acc ->
      if number != x, do: {:cont, acc}, else: {:halt, index + acc}
    end)
  end
end

{time, solution} = :timer.tc(fn -> FrogRiverOne.solution(5, [1, 3, 1, 4, 2, 3, 5, 4]) end)

IO.puts("X = 5 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} = :timer.tc(fn -> FrogRiverOne.solution(3, [1, 3, 1, 4, 2, 3, 5, 4]) end)

IO.puts("X = 3 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} = :timer.tc(fn -> FrogRiverOne.solution(4, [1, 3, 1, 4, 2, 3, 5, 4]) end)

IO.puts("X = 4 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
IO.puts("#{time / 1000} ms")

{time, solution} = :timer.tc(fn -> FrogRiverOne.solution(1, [1, 3, 1, 4, 2, 3, 5, 4]) end)

IO.puts("X = 1 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
IO.puts("#{time / 1000} ms")

# https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/

# A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river
# (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.

# You are given an array A consisting of N integers representing the falling leaves.
# A[K] represents the position where one leaf falls at time K, measured in seconds.

# The goal is to find the earliest time when the frog can jump to the other side of the river.
# The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to
# find the earliest moment when all the positions from 1 to X are covered by leaves).
# You may assume that the speed of the current in the river is negligibly small,
# i.e. the leaves do not change their positions once they fall in the river.

# For example, you are given integer X = 5 and array A such that:

#   A[0] = 1
#   A[1] = 3
#   A[2] = 1
#   A[3] = 4
#   A[4] = 2
#   A[5] = 3
#   A[6] = 5
#   A[7] = 4
# In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.

# Write a function:

# def solution(X, A)

# that, given a non-empty array A consisting of N integers and integer X,
# returns the earliest time when the frog can jump to the other side of the river.

# If the frog is never able to jump to the other side of the river, the function should return −1.

# For example, given X = 5 and array A such that:

#   A[0] = 1
#   A[1] = 3
#   A[2] = 1
#   A[3] = 4
#   A[4] = 2
#   A[5] = 3
#   A[6] = 5
#   A[7] = 4
# the function should return 6, as explained above.

# Write an efficient algorithm for the following assumptions:

# N and X are integers within the range [1..100,000];
# each element of array A is an integer within the range [1..X].