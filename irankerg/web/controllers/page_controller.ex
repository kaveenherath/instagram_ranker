defmodule Irankerg.PageController do
  use Irankerg.Web, :controller
  use HTTPotion.Base

  def index(conn, _params) do
    render conn, "index.html"
  end

  def getUser(conn, %{"id" => id}) do
    access_token = System.get_env("ACCESS_TOKEN")
    result = HTTPotion.get("https://api.instagram.com/v1/users/" <> id <> "/", query: %{access_token: access_token})
    parsed = Poison.Parser.parse!(result.body)
    json conn, parsed
  end



  def getRecent(conn, %{"id" => id}) do
    access_token = System.get_env("ACCESS_TOKEN")
    result = HTTPotion.get("https://api.instagram.com/v1/users/" <> id <> "/media/recent/", query: %{access_token: access_token})
    parsed = Poison.Parser.parse!(result.body)
    json conn, parsed
  end


  def getLiked(conn, %{"id" => id}) do
    access_token = System.get_env("ACCESS_TOKEN")
    result = HTTPotion.get("https://api.instagram.com/v1/users/" <> id <> "/media/liked/", query: %{access_token: access_token})
    parsed = Poison.Parser.parse!(result.body)
    json conn, parsed
  end



end
