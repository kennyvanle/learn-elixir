defmodule Dictionary do

  # this is created at compile time, we can do this to read only once
  @word_list "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/, trim: true)

  def random_word do
    @word_list
    |> Enum.random()
  end
end
