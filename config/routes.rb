Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # localhost:3000/users
  # get '/users', to: 'users#index'
  # get '/workouts', to: 'workouts#index'
  # get '/foods', to: 'foods#index'
  # get '/waters', to: 'waters#index'
  # get 'profiles', to: 'profile#index'

  # localhost:3000/users/1
  # get 'users/:id', to: 'users#show'
  # get 'users/:id/workout', to: 'workouts#show'
  # get 'users/:id/food', to: 'foods#show'
  # get 'users/:id/water', to: 'waters#show'
  # get 'users/:id/profile', to: 'profile#show'

  # localhost:3000/users
  # post '/users', to: 'users#create'

  # localhost:3000/users/1 
  # put '/users/:id', to: 'users#update'

  # localhost:3000/users/1 
  # delete '/users/:id', to: 'users#destroy'

  resources :users do
    get 'workouts', to: 'users#workouts_index'
    get 'foods', to: 'users#foods_index'
    get 'waters', to: 'users#waters_index'
    get 'profile', to: 'users#profile_index'
  end

  resources :workouts, only: [:create, :update, :destroy]
  resources :foods, only: [:create, :update, :destroy]
  resources :waters, only: [:create, :update, :destroy]
  resources :profile, only: [:create, :update, :destroy]
end
