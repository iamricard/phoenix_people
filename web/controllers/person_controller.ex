defmodule PhoenixPeople.PersonController do
  use PhoenixPeople.Web, :controller

  alias PhoenixPeople.Person

  def index(conn, _params) do
    people = Repo.all(Person)
    render(conn, "index.json", people: people)
  end

  def create(conn, %{"person" => person_params}) do
    changeset = Person.changeset(%Person{}, person_params)

    case Repo.insert(changeset) do
      {:ok, person} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", person_path(conn, :show, person))
        |> render("show.json", person: person)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixPeople.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
