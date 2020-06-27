defmodule CyclicRotation do
  def solution(array, k) do
    if Enum.count(array) == k do
      array
    else
      Enum.slice(array, -k, k) ++ Enum.drop(array, -k)
    end
  end
end

{time, solution} = :timer.tc(fn -> CyclicRotation.solution([3, 8, 9, 7, 6], 3) end)

IO.puts("given: ([3, 8, 9, 7, 6], 3): output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms")

{time, solution} = :timer.tc(fn -> CyclicRotation.solution([1, 2, 3, 4], 4) end)

IO.puts("given: ([1, 2, 3, 4], 4): output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms")

{time, solution} = :timer.tc(fn -> CyclicRotation.solution([0, 0, 0], 1) end)

IO.puts("given: ([0, 0, 0], 1): output is:")
IO.inspect(solution)
IO.puts("#{time / 1000} ms")

# {time, solution} = :timer.tc(fn -> FrogRiverOne.solution(3, [1, 3, 1, 4, 2, 3, 5, 4]) end)

# IO.puts("X = 3 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
# IO.puts("#{time / 1000} ms")

# {time, solution} = :timer.tc(fn -> FrogRiverOne.solution(4, [1, 3, 1, 4, 2, 3, 5, 4]) end)

# IO.puts("X = 4 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
# IO.puts("#{time / 1000} ms")

# {time, solution} = :timer.tc(fn -> FrogRiverOne.solution(1, [1, 3, 1, 4, 2, 3, 5, 4]) end)

# IO.puts("X = 1 and A = [1, 3, 1, 4, 2, 3, 5, 4]: output is - #{solution}")
# IO.puts("#{time / 1000} ms")

# https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/

# An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index,
# and the last element of the array is moved to the first place.

# For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7]
# (elements are shifted right by one index and 6 is moved to the first place).

# The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.

# Write a function:
#     function solution(A, K);

# that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.

# For example, given
#     A = [3, 8, 9, 7, 6]
#     K = 3
# the function should return [9, 7, 6, 3, 8]. Three rotations were made:
#     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
#     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
#     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
# For another example, given
#     A = [0, 0, 0]
#     K = 1
# the function should return [0, 0, 0]
# Given
#     A = [1, 2, 3, 4]
#     K = 4
# the function should return [1, 2, 3, 4]

# Assume that:

# N and K are integers within the range [0..100];
# each element of array A is an integer within the range [−1,000..1,000].
# In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
