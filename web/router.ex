defmodule YourWeather.Router do
  use YourWeather.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", YourWeather do
    pipe_through :api

    resources "/users", UserController, only: [:create, :show]
  end

  scope "/", YourWeather do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/users/register", UserController, :register
    post "/users/authenticate", UserController, :authenticate

    ## catch-all routes
    get "/*path", PageController, :index
    post "/*path", PageController, :index
  end

  scope "/" do
    pipe_through :api
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: YourWeather.Schema,
      interface: :simple,
      context: %{pubsub: YourWeather.Endpoint}
  end

  # Other scopes may use custom stacks.
  # scope "/api", YourWeather do
  #   pipe_through :api
  # end
end
