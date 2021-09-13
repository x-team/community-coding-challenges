# Time complexity: O(n^2) - quadrático, N*N, sendo N o tamanho do vetor nums

# Elixir não foi criado para resolver problemas de CPU-bound
# ou seja, caso você precise resolver problemas onde exija muito da CPU, elixir definitivamente
# não é a linguagem correta =(. Pode até existir um modo melhor de resolver esse problema utilizando elixir
# porém comparado com outras linguagens como (C++, Rust, Golang ou até Python) a complexidade de implementação
# fica extremamente alta.

# Acredito que possa haver um modo de resolver o problema de outra maneira
# Porém o meu conhecimento de elixir se limita apenas a essa solução XD

defmodule Solution do
  def two_sum(nums, target) do
    nums
    |> Enum.with_index
    |> get_positions(target)
  end

  defp get_positions([{number, current_index} | tail], target) do
    case exists_sum?(tail, number, target) do
      nil -> get_positions(tail, target)
      new_index -> [current_index, new_index]
    end
  end

  defp exists_sum?([{new_value, index} | _tail], current, target) when current + new_value == target, do: index
  defp exists_sum?([_ | tail], current, target), do: exists_sum?(tail, current, target)
  defp exists_sum?(_, _, _), do: nil

  @doc """
    Given an array of integers nums and an integer target, return indices of the two numbers
    such that they add up to target.

    Solution proposed to the Leetcode Two Sum challenge.

    Time complexity: O(N)
    Space complexity: O(N)

    Solves by creating a memo of `%{n => index}` for every `n` visited in the list.
    Then, for every `n` in the list, checks if `target - n` was already visited (is on the memo map)
    If there is such an element on the memo map, returns `[memo[target - n], index]`
    Else, if it reaches the end of the list, returns `[]`

  ## Examples

      iex> Solution.two_sum_linear([2, 7, 11, 15], 9)
      [0, 1]
      iex> Solution.two_sum_linear([3, 2, 4], 6)
      [1, 2]
      iex> Solution.two_sum_linear([3, 3], 6)
      [0, 1]
      iex> Solution.two_sum_linear([3, 5], 7)
      []
  """
  def two_sum_linear(nums, target) do
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
