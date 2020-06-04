defmodule YourWeather.UserController do
    use YourWeather.Web, :controller
  
    def register(conn, params) do
      IO.puts("This is params: #{inspect params}")
      params
      |> convert_params_to_map()
      |> YourWeather.Users.create_user()
      
      conn
      |> put_status(200)
      |> redirect(to: "/")
    end

    defp convert_params_to_map(params) do
        for {key, value} <- params, into: %{}, do: {String.to_atom(key), value}
    end
  end