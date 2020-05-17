defmodule YourWeather.PageController do
  use YourWeather.Web, :controller
  alias YourWeather.User
  alias YourWeather.Repo
  require Logger

  def index(conn, _params) do
    html(conn, File.read!("ng_app/dist/your-weather/index.html"))
  end

  def register(conn, params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert!()
    
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> html(File.read!("ng_app/dist/your-weather/index.html"))
  end
end
