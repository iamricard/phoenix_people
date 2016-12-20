defmodule PhoenixPeople.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :role, :string
      add :location, :string
      add :avatar, :string

      timestamps()
    end

  end
end
