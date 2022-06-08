Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"

  get "/auth/google_oauth2/callback", to: "users#create"
  get "/dashboard", to: "dashboard#show"

  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  get "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :index] do
    resources :trips, only: [:index, :create, :show]
    resources :items, only: [:show, :index, :new, :create, :destroy, :edit, :update]
  end

  get "/areas/search", to: "areas#index"
  get "/areas/:area_id/trips/:trip_id/users/new", to: "trip_users#new"
  get "/areas/:area_id/trips/new", to: "trips#new"
  post "/users/:user_id/trips/new", to: "trips#create"
  post "/trips/:trip_id/users", to: "trip_users#create"

  resources :trips, only: [:show, :update, :destroy]
end
