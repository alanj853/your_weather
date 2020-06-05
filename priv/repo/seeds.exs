# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     YourWeather.Repo.insert!(%YourWeather.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias YourWeather.User
alias YourWeather.Repo

%User{email: "test123@gmail.com", first_name: "user1", last_name: "lastname1", password_hash: "abcd", location: "Cork"} |> Repo.insert!
%User{email: "test456@gmail.com", first_name: "user2", last_name: "lastname2", password_hash: "efgh", location: "Galway"} |> Repo.insert!