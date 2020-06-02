defmodule YourWeather.UserResolver do
  alias YourWeather.Repo
  alias YourWeather.User
  
    def all_users(_root, _args, _info) do
      {:ok, list_users()}
    end

    def create_user(_root, args, _info) do
      create_user(args)
    end

    @doc """
    Returns the list of users.

    ## Examples

        iex> list_users()
        [%User{}, ...]

    """
    def list_users() do
      Repo.all(User)
    end

    @doc """
    Creates a user.

    ## Examples

        iex> create_user(%{field: value})
        {:ok, %User{}}

        iex> create_user(%{field: bad_value})
        {:error, %Ecto.Changeset{}}

    """
    def create_user(attrs \\ %{}) do
      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()
    end
  end