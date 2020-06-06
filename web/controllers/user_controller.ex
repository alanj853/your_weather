defmodule YourWeather.UserController do
    use YourWeather.Web, :controller
    require Logger
    alias YourWeather.Users
    alias YourWeather.User
  
    def create(conn, params) do
      IO.puts("This is params: #{inspect params}")
      conn
      |> json(%{})
    end
    
    def register(conn, params) do
      IO.puts("This is params: #{inspect params}")
      params
      |> convert_params_to_map()
      |> YourWeather.Users.create_user()
      
      conn
      |> put_status(200)
      |> redirect(to: "/")
    end

    def authenticate(conn, params = %{"email" => email, "password" => password}) do
           

      user = 
      Enum.filter(Users.list_users(),
        fn user ->
          Map.get(user, :email) == email && Map.get(user, :password) == password
        end
      )

      case user do
        [%User{}] ->
          conn
          |> put_status(200)
          |> redirect(to: "/")
        _ ->
          Logger.warn("Credentials '#{inspect params}' do not match any in DB")
          conn
          |> put_status(401)
          |> redirect(to: "/")
      end
    end

    defp convert_params_to_map(params) do
        for {key, value} <- params, into: %{}, do: {String.to_atom(key), value}
    end
  end