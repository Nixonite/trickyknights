defmodule AppWeb.Router do
  use AppWeb, :router

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

  pipeline :auth do
    plug :browser
    plug AppWeb.Helpers.CheckAuth
  end

  scope "/", AppWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController, only: [:index, :show]
    get "/admin/login", SessionController, :new
    post "/admin/login", SessionController, :create
  end

  scope "/admin", AppWeb do
    pipe_through :auth

    get "/", AdminController, :index
    post "/test", AdminController, :create
    resources "/users", UserController
    resources "/games", GameController
    resources "/posts", PostController
    delete "/sign-out", SessionController, :delete
  end
end
