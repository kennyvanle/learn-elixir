defmodule Dictionary.Runtime.Application do

  use Application

  # application start... think application main
  # refer to mix.exs
  def start(_type, _args) do
    children = [
      { Dictionary.Runtime.Server, [] },
    ]
    # Tells the supervisor how to handle child creation and failures.
    # We used one_for_one, where each child process has an independent life.
    # If a child dies, it alone is restarted.
    options = [
      name: Dictionary.Runtime.Supervisor,
      strategy: :one_for_one,
    ]
    Supervisor.start_link(children, options)
  end
end
