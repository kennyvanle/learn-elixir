defmodule Solution do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate([], _), do: false
  def contains_duplicate([head | tail], map) when is_map_key(map, head), do: true
  def contains_duplicate([head | tail], map \\ %{}),
    do: contains_duplicate(tail, Map.put(map, head, nil))
end
