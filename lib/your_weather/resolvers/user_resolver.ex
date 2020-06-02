defmodule YourWeather.UserResolver do
  alias YourWeather.Users
  
    def all_users(_root, _args, _info) do
      {:ok, Users.list_users()}
    end

    def create_user(_root, args, _info) do
      Users.create_user(args)
    end
  end