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
end
