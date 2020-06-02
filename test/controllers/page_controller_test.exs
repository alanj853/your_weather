defmodule YourWeather.PageControllerTest do
  use YourWeather.ConnCase

  @index_file "./ng_app/dist/your-weather/index.html"

  test "GET /", %{conn: conn} do
    if File.exists?(@index_file) do
      conn = get conn, "/"
      assert html_response(conn, 200) =~ File.read!(@index_file)
    else
      IO.puts("Skipping test as #{@index_file} is missing")
      true
    end
  end
end
