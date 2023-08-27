defmodule Dictionary.Runtime.Application do

  use Application

  # application start... think application main
  # refer to mix.exs
  def start(_type, _args) do
    Dictionary.Runtime.Server.start_link()
  end
end
