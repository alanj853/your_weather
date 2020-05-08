defmodule YourWeather.Schema do
    use Absinthe.Schema
  
    alias YourWeather.UserResolver
  
    object :user do
      field :id, non_null(:id)
      field :email, non_null(:string)
      field :first_name, non_null(:string)
      field :last_name, non_null(:string)
      field :password, non_null(:string)
    end
  
    query do
      field :all_users, non_null(list_of(non_null(:user))) do
        resolve &UserResolver.all_users/3
      end
    end
  end