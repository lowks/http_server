# HTTPServer
A simple and self-contained HTTP Server for elixir.
It's intended for simple testing of HTTP request/response without setting up stand-alone http server.

### Usage
```Elixir
defmodule HttpServerTest do
  use ExUnit.Case

  setup_all do
    HTTPotion.start
  end

  test "test default server response" do
    HttpServer.start
    response = HTTPotion.get("http://localhost:8080")
    assert(response.body == "Hello World")
  end

  test "test custom server response" do
    HttpServer.start(path: "/test", port: 4000, response: "Custom Response")
    response = HTTPotion.get("http://localhost:4000/test")
    assert(response.body == "Custom Response")
  end
end
```
