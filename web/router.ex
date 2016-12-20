defmodule PhoenixPeople.Router do
  use PhoenixPeople.Web, :router

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

  scope "/", PhoenixPeople do
    pipe_through :browser # Use the default browser stack

    resources "/", PersonController, except: [:new, :edit]
  end
end
