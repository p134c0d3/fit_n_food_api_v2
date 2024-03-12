Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # localhost:3000/users
  get '/users', to: 'users#index'
  get '/workouts', to: 'workouts#index'
  get '/foods', to: 'foods#index'
  get '/waters', to: 'waters#index'
  get 'profiles', to: 'profile#index'

  # localhost:3000/users/1
  get 'users/:id', to: 'users#show'
  get 'users/:id/workout', to: 'workouts#show'
  get 'users/:id/food', to: 'foods#show'
  get 'users/:id/water', to: 'waters#show'
  get 'users/:id/profile', to: 'profile#show'

  # localhost:3000/users
  post '/users', to: 'users#create'
end
