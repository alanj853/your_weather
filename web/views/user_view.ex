defmodule YourWeather.UserView do
    use YourWeather.Web, :view
    
    def render("jwt.json", %{jwt: jwt}) do
        %{jwt: jwt}
    end
end