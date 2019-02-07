defmodule ShopmapWeb.Router do
  use ShopmapWeb, :router

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

  scope "/", ShopmapWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/mylocation", PageController, :mylocation
    resources "/shops", ShopController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShopmapWeb do
  #   pipe_through :api
  # end
end
