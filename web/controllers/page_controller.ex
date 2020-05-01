defmodule YourWeather.PageController do
  use YourWeather.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
