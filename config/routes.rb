Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  
  get '/auth/google_oauth2/callback', to: 'users#create'
  get '/dashboard', to: 'dashboard#show'

  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  get "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :index] do
    resources :items, only: [:show, :index]
  end
end
