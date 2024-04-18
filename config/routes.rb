Rails.application.routes.draw do
  scope '/' do
    post 'login', to: 'sessions#create'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :users do
    resources :profile, to: 'profile#profile_index'
    resources :foods, to: 'foods#foods_index'
    resources :waters, to: 'waters#waters_index'
    resources :workouts, to: 'workouts#workouts_index'
  end
  resources :workouts, only: %i[index create update destroy]
  resources :foods, only: %i[index create update destroy]
  resources :waters, only: %i[index create update destroy]
  resources :profile, only: %i[index create update destroy]
end
