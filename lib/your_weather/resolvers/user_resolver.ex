defmodule YourWeather.UserResolver do
  alias YourWeather.Repo
  alias YourWeather.User
  
    def all_users(_root, _args, _info) do
      {:ok, Repo.all(User)}
    end
  end