defmodule PhoenixPeople.PersonView do
  use PhoenixPeople.Web, :view

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PhoenixPeople.PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      name: person.name,
      role: person.role,
      location: person.location,
      avatar: person.avatar}
  end
end
