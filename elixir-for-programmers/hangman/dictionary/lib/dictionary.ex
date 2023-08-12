defmodule Dictionary do
 def word_list do
   words = File.read!("assets/words.txt")
   String.split(words, ~r/\n/, trim: true)
   # in elixir, the return value is always the last expression evaluated
 end

 def random_word do
   Enum.random(word_list())
 end
end
