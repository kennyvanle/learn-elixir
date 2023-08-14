defmodule Web.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/elixir" do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> send_file(200, "lib/web/elixir.html")
  end

  match _ do
    send_resp(conn, 404, "This is not the page you're looking for.")
  end
end
