# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixPeople.Repo.insert!(%PhoenixPeople.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

File.stream!("./data/seed.csv")
  |> CSV.decode
  |> Enum.map(fn person ->
      %PhoenixPeople.Person {
        name: Enum.at(person, 0),
        role: Enum.at(person, 1),
        location: Enum.at(person, 2),
        avatar: Enum.at(person, 3)
      }
     end)
  |> Enum.each(fn person -> PhoenixPeople.Repo.insert! person end)
