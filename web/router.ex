defmodule Exchange.Router do
  use Exchange.Web, :router

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

  scope "/", Exchange do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :signin
    post "/login", PageController, :signin_action

    get "/consent", ConsentController, :index
    get "/consent/blue_badge", ConsentController, :blue_badge
    get "/consent/redirecting", ConsentController, :redirecting
  end

  # Other scopes may use custom stacks.
  scope "/api", Exchange do
     pipe_through :api
     get "/", APIController, :index
     get "/blue_badge", APIController, :blue_badge
  end
end
