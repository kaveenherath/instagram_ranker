defmodule Irankerg.Router do
  use Irankerg.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Irankerg do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index

  end

  scope "/api", Irankerg do
    pipe_through :api
    get "/user/:id", PageController, :getUser
    get "/user/:id/recent", PageController, :getRecent
    get "/user/:id/liked", PageController, :getLiked
  end
end
