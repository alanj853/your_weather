defmodule YourWeather.PageController do
  use YourWeather.Web, :controller

  def index(conn, _params) do
    html(conn, File.read!("ng_app/dist/your-weather/index.html"))
  end
end
