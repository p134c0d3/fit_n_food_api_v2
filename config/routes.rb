Rails.application.routes.draw do
  scope '/' do 
    post 'login', to: 'sessions#create'
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    collection do
      
      # get 'workouts', to: 'users#workouts_index'
      # get 'foods', to: 'users#user_foods'
      # get 'waters', to: 'users#waters_index'
      # get 'profile', to: 'users#profile_index'
    end
  end

  resources :workouts do
    collection do 
      get 'user_workouts', to: 'workouts#workouts_index'
    end
  end
  resources :foods do 
    collection do
      get 'user_foods', to: 'foods#user_foods'
    end
  end
  resources :waters do
    collection do 
      get 'user_waters', to: 'waters#waters_index'
    end
  end
  resources :profile do
    collection do
      get 'profile', to: 'profile#profile_index'
    end
  end
end
