defmodule HelloWorld do
  use ExUnit.Case, async: true
  use Plug.Test
  doctest HelloWorld.Web

  @opts HelloWorld.Web.init([])

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "returns 'hello world :)'" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = HelloWorld.Web.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "hello world :)"
  end

  test "returns 'not found :/'" do
    # Create a test connection
    conn = conn(:get, "/foobar")

    # Invoke the plug
    conn = HelloWorld.Web.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "not found :/"
  end

end