Rails.application.routes.draw do
  get 'sessions/create'
  scope '/' do 
    post 'login', to: 'sessions#create'
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

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
