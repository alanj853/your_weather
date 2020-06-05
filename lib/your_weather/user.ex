defmodule YourWeather.User do
    use Ecto.Schema
    import Ecto.Changeset
  
  
    schema "users" do
      field :email, :string
      field :first_name, :string
      field :last_name, :string
      field :password_hash, :string
      field :location, :string
  
      timestamps()
    end
  
    @doc false
    def changeset(user, attrs) do
      user
      |> cast(attrs, [:email, :first_name, :last_name, :password_hash, :location])
      |> validate_required([:email, :first_name, :last_name, :password_hash, :location])
    end

end