defmodule YourWeather.FallbackController do
  use YourWeather.Web, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Login error"})
  end
end
