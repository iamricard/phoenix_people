defmodule PhoenixPeople.Person do
  use PhoenixPeople.Web, :model

  schema "people" do
    field :name, :string
    field :role, :string
    field :location, :string
    field :avatar, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :role, :location, :avatar])
    |> validate_required([:name, :role, :location, :avatar])
  end
end
