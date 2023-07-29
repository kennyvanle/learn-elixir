defmodule Test do
  values = [
    1,
    0x1F,
    1.0,
    true,
    :atom,
    "elixir"
  ]

  Enum.each(values, fn x ->
    IO.puts(x)
    IO.inspect(IEx.Info.info(x))
    IO.puts('************************************')
  end)

  ls = [1, 2, 3]
  IO.inspect(ls)
  IO.inspect(IEx.Info.info(ls))
  IO.puts('************************************')

  tuple = {1, 2, 3}
  IO.inspect(tuple)
  IO.inspect(IEx.Info.info(tuple))
  IO.puts('************************************')


  IO.puts("we can add numbers")
  sum = 4 + 5
  IO.puts("4 + 5 = #{sum}")

  IO.puts("we can round numbers")
  rounded = round(3.58)
  IO.puts("3.58 rounded is #{rounded}")

  IO.puts("we can truncate numbers")
  truncated = trunc(3.58)
  IO.puts("3.58 truncated is #{truncated}")

  IO.puts("we can ask for help by running h trunc/1")

  IO.puts("the booleans true and false are atoms!")
  IO.puts("is true == :true? #{true == :true}")
  IO.puts("is true an atom? #{is_atom(true)}")
  IO.puts("is true a boolean? #{is_boolean(true)}")

  IO.puts('we can uppercase with String.upcase: #{String.upcase("elixir")}')
  IO.puts('we can get length with String.length: #{String.length("elixir")}')
  IO.puts("single-quotes and double-quote representations are NOT equivalent")

  IO.puts("a final note is that while we can update values with methods, they only stay updated if we reassign them. all values are immutable.for example, every operation on a typle returns a new typle, it never changes the given one")
  IO.puts("*****************************")
  IO.puts("lists are stored in memory as linked lits which emans that each element in a list holds its value and we need to traverse the whole list in order to figure out its size")
  IO.puts("this makes it easy to combine lists with ++")
  ls = [1, 2, 3, 4]
  newls = ls ++ [0]
  IO.puts("[1, 2, 3, 4] ++ [0] =")
  IO.inspect(newls)

end
