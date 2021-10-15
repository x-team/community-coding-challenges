defmodule Solution do
  @pairs %{"(" => ")", "[" => "]", "{" => "}"}

  @spec is_valid(string :: String.t) :: boolean
  def is_valid(string) do
    string
    |> String.codepoints()
    |> Enum.reduce([], &add_or_remove_from_stack/2)
    |> Enum.empty?()
  end

  defp add_or_remove_from_stack(char, []), do: [char]
  defp add_or_remove_from_stack(char, [last | rest] = stack) do
    if char == @pairs[last] do
      rest
    else
      [char | stack]
    end
  end
end
