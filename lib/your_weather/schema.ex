defmodule YourWeather.Schema do
    use Absinthe.Schema
  
    alias YourWeather.UserResolver
  
    object :user do
      field :id, non_null(:id)
      field :email, non_null(:string)
      field :first_name, non_null(:string)
      field :last_name, non_null(:string)
      field :password_hash, non_null(:string)
      field :location, non_null(:string)
    end
  
    query do
      field :all_users, non_null(list_of(non_null(:user))) do
        resolve &UserResolver.all_users/3
      end
    end

    mutation do
      field :create_user, :user do
        arg :email, non_null(:string)
        arg :first_name, non_null(:string)
        arg :last_name, non_null(:string)
        arg :password_hash, non_null(:string)
        arg :location, non_null(:string)
    
        resolve &UserResolver.create_user/3
      end
    end
  end