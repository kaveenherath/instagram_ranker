defmodule Irankerg.PageController do
  use Irankerg.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
