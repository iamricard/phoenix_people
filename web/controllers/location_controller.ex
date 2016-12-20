defmodule PhoenixPeople.LocationController do
  use PhoenixPeople.Web, :controller

  alias PhoenixPeople.Person

  def show(conn, %{"location" => location}) do
    render(conn, "show.json", %{
      location: Person |> where([p], ilike(p.location, ^location)) |> Repo.all
    })
  end
end
