defmodule ElixirSolution do
  @moduledoc """
    Solution proposed to the Leetcode Two Sum challenge.

    Time complexity: O(N)
    Space complexity: O(N)
  """

  @doc """
    Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

    Solves by creating a memo of `%{n => index}` for every `n` visited in the list.
    Then, for every `n` in the list, checks if `target - n` was already visited (is on the memo map)
    If there is such an element on the memo map, returns `[memo[target - n], index]`
    Else, if it reaches the end of the list, returns `[]`

  ## Examples

      iex> ElixirSolution.two_sum([2, 7, 11, 15], 9)
      [0, 1]
      iex> ElixirSolution.two_sum([3, 2, 4], 6)
      [1, 2]
      iex> ElixirSolution.two_sum([3, 3], 6)
      [0, 1]
      iex> ElixirSolution.two_sum([3, 5], 7)
      []
  """
  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> find_first_sum(target)
  end

  defp find_first_sum(list, target, memo \\ %{})

  defp find_first_sum([{n, index} | _tail], target, memo)
       when is_map_key(memo, target - n),
       do: [memo[target - n], index]

  defp find_first_sum([{n, index} | tail], target, memo),
    do: find_first_sum(tail, target, memo |> Map.put(n, index))

  defp find_first_sum([], _target, _memo), do: []
end
