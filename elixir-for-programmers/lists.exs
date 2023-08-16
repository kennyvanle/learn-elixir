# we will name this Lists to avoid conflict with existing List
# as a reminder, we can run this in iex and use: c "lists.exs"
# to compile and execute our code with: Lists.method(input)
defmodule Lists do
 
  # we can start by defining a length function
  # since there is no "looping over", we use recursion
  # we use underscore when we have unused variables
  # ex: [1, 2, 3] -> 3
  # ex: [] -> 0
  def len([]),     do: 0
  def len([_h|t]), do: 1 + len(t)

  # now lets create a function that sums
  def sum([]),    do: 0
  def sum([h|t]), do: h + sum(t)

  # square
  def square([]),    do: []
  def square([h|t]), do: [ h*h | square(t) ]

  # double
  def double([]),    do: []
  def double([h|t]), do: [ 2*h | double(t) ]

  # what if we instead created a map instead of this dupe code?
  # there are Enum.functions that are equivalent!
  # we can invoke this like: Lists.map [1,2,3], fn x -> x*x end
  # and the above is equivalent to: Enum.map [1,2,3], fn -> x*x end
  def map([], _func),   do: []
  def map([h|t], func), do: [ func.(h) | map(t, func) ]
end
