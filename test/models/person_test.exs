defmodule PhoenixPeople.PersonTest do
  use PhoenixPeople.ModelCase

  alias PhoenixPeople.Person

  @valid_attrs %{avatar: "some content", location: "some content", name: "some content", role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Person.changeset(%Person{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end
