defmodule Dictionary.Runtime.Server do

  @type t :: pid()

  # __MODULE__ is an abbreviation for the full name of the current module
  @me __MODULE__

  # this designates that we will be using a supervisor
  # this adds the child_spec function to the module
  use Agent

  alias Dictionary.Impl.WordList

  # now we can do something like:
  # {:ok, pid} = Dictionary.Runtime.Server.start_link
  # to create the agent and get a pid
  # and then:
  # Dictionary.Runtime.Server.random_word(pid)
  # to generate our random words

  # now we can do better
  # we can create a "named pid" which we can then pass into random_word
  # so that no longer takes a pid, it just looks it up by name
  def start_link(_) do
    # start link, register pid under any name supplied
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word() do
    # this will pass in the pid name, thus looking up the pid
    # now we don't need to lookup a pid
    Agent.get(@me, &WordList.random_word/1)
  end
end
