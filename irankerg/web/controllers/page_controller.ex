defmodule Irankerg.PageController do
  use Irankerg.Web, :controller
  use HTTPotion.Base

  def index(conn, _params) do
    render conn, "index.html"
  end

  def getSelf(conn, %{"user" => id}) do
    result = HTTPotion.get("httpbin.org/get", query: %{page: 2})
    parsed = Poison.Parser.parse!(result.body, keys: :atoms!)
    IO.puts(parsed.url)
    json conn, parsed.url
  end

end
