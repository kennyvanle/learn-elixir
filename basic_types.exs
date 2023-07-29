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
end
