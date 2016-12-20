defmodule PhoenixPeople.LocationView do
  use PhoenixPeople.Web, :view

  def render("show.json", %{location: location}) do
    %{data: render_many(location, PhoenixPeople.PersonView, "person.json")}
  end
end
