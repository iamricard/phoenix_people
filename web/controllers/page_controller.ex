defmodule PhoenixPeople.PageController do
  use PhoenixPeople.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
