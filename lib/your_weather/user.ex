defmodule YourWeather.User do
    use Ecto.Schema
    import Ecto.Changeset
  
  
    schema "users" do
      field :email, :string
      field :first_name, :string
      field :last_name, :string
      field :password_hash, :string
      field :location, :string
      
      # Virtual fields:
      field :password, :string, virtual: true
      field :password_confirmation, :string, virtual: true
  
      timestamps()
    end
  
    @doc false
    def changeset(user, attrs) do
      user
      |> cast(attrs, [:email, :first_name, :last_name, :password, :password_confirmation, :location]) # Remove hash, add pw + pw confirmation
      # |> validate_required([:email, :first_name, :last_name, :password, :password_confirmation, :location]) # Remove hash, add pw + pw confirmation
      |> validate_required([:email, :password, :password_confirmation]) # Remove hash, add pw + pw confirmation
      |> validate_format(:email, ~r/@/) # Check that email is valid
      |> validate_length(:password, min: 8) # Check that password length is >= 8 
      |> validate_confirmation(:password) # Check that password === password_confirmation
      |> unique_constraint(:email)
      |> put_password_hash()
    end

    defp put_password_hash(changeset) do
      case changeset do
        %Ecto.Changeset{valid?: true, changes: %{password: pass}}
          ->
            put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
        _ ->
            changeset
      end
    end

end