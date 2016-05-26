require IEx

defmodule HelloWorld.Web do
  use Plug.Router

  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json, HexWeb.Parsers.HexVendor],
                     json_decoder: Poison
  plug :match
  plug :dispatch

  def init(options), do: options

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http HelloWorld.Web, []
  end

  get "/api/ping", do: send_resp(conn, 200, "pong")
  get "/", do: send_resp(conn, 200, "hello world :)")

  match _, do: send_resp(conn, 404, "not found :/")

end
