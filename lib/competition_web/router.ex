defmodule CompetitionWeb.Router do
  use CompetitionWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: CompetitionWeb.Schema

    forward "/api", Absinthe.Plug, schema: CompetitionWeb.Schema
  end

  # scope "/", CompetitionWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", CompetitionWeb do
  #   pipe_through :api
  # end
end
