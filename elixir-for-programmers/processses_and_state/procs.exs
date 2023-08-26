defmodule Procs do
  # we can spawn new procs by: pid = spawn Procs, :hello, [0]
  def hello(count) do
    receive do
      # what if i want to be notified when a crash occurs?
      # we can do something like this:
      # pid = spawn_link Procs, :hello, [ 0 ]
      # this links the creating and created processes. if one dies an abnormal death, the other is killed.
      # however, if we crash with reason ":normal", then we fail silently
      { :crash, reason } ->
        exit(reason)
      { :quit } ->
        # we can test this with: Process.alive? pid
        IO.puts("I'm outta here")
      { :add, n } ->
      hello(count + n)
    msg ->
      IO.puts("#{count}: Hello #{inspect msg}")
      hello(count)
    end
  end
end
