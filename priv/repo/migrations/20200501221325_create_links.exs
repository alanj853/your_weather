defmodule YourWeather.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :password, :string

      timestamps()
    end

  end
end
