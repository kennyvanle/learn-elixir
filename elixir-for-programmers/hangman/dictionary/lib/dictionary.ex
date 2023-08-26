defmodule Dictionary do

  alias Dictionary.Impl.WordList

  @opaque t :: WordList.t

  @spec start() :: t
  # :word_list is the name of the function in the module we are delegating to
  defdelegate start, to: WordList, as: :word_list

  @spec random_word(t) :: String.t
  defdelegate random_word(word_list), to: WordList

end
