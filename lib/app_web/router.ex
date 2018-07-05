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
    get "/admin/sign-in", SessionController, :new
    post "/admin/sign-in", SessionController, :create
  end

  scope "/admin", AppWeb do
    pipe_through :auth

    resources "/users", UserController, only: [:create, :new]

    delete "/sign-out", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppWeb do
  #   pipe_through :api
  # end
end
