defmodule HackDayApiWeb.Router do
  use HackDayApiWeb, :router

  alias HackDayApi.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt do
    plug Guardian.AuthPipeline
  end

  scope "/api", HackDayApiWeb do
    pipe_through :jwt

    get "/users", UsersController, :index
    get "/users/:id", UsersController, :show
    put "/users/:id", UsersController, :update
    delete "/users/:id", UsersController, :delete
  end

  scope "/api", HackDayApiWeb do
    pipe_through :api

    post "/login", LoginController, :login
    post "/users", UsersController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: HackDayApiWeb.Telemetry
    end
  end
end
