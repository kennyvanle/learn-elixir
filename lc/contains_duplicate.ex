defmodule Solution do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate(nums) do
    distinct = 
      Enum.uniq(nums)
      |> Enum.count()
    Enum.count(nums) != distinct
  end
end
