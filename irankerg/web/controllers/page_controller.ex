defmodule Irankerg.PageController do
  use Irankerg.Web, :controller
  use HTTPotion.Base

  def index(conn, _params) do
    render conn, "index.html"
  end
  #
  # def getUser(conn, %{"id" => id}) do
  #
  #   access_token = System.get_env("ACCESS_TOKEN")
  #   # https://api.instagram.com/v1/users/self/?access_token=ACCESS-TOKEN
  #   url = "https://api.instagram.com/v1/users/" <> id <> "/?access_token=" <> access_token
  #   result = HTTPotion.get(url, query: %{page: 2})
  #   parsed = Poison.Parser.parse!(result.body, keys: :atoms!)
  #   IO.puts(parsed)
  #   json conn, parsed
  # end
  #
  def getUser(conn, %{"id" => id}) do
    access_token = System.get_env("ACCESS_TOKEN")
  #  request_url = "https://api.instagram.com/v1/users/" <> id <> "/?access_token=" <> access_token
    # parsed = Poison.Parser.parse!(result.body, keys: :atoms!)
    result2 = HTTPotion.get("https://api.instagram.com/v1/users/self/", query: %{access_token: "3715405804.bb1a564.e26642c4a28f4956b527d09a30e1bf30"})
    result = HTTPotion.get("httpbin.org/get", query: %{page: 2})
    parsed = Poison.Parser.parse!(result.body, keys: :atoms!)
    parsed2= Poison.Parser.parse!(result2.body, keys: :atoms!)


    json conn, parsed.url
  end

end
