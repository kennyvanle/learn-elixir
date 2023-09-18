defmodule MemoryWeb.MemoryController do
  use MemoryWeb, :controller

  def hello(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :hello)
  end
end
