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
    resources :trips, only: [:index, :create]
    resources :items, only: [:show, :index, :new, :create, :destroy, :edit, :update]
  end

  get "/areas", to: "areas#index"
  get "/areas/:id", to: "areas#show"
  get "/areas/:area_id/trips/new", to: "trips#new"
  # post "/areas/:area_id/trips/new", to: "trips#create"
  # get "/areas/:area_id/trips/new/users", to: "user_trips#new"
  # post "/areas/:area_id/trips/new/users", to: "user_trips#create"

  get "/trips/:trip_id/items", to: "trip_items#new"
  post "/trips/:trip_id/items", to: "trip_items#create"
  patch "/trips/:trip_id/items", to: "trip_items#update"

  resources :trips, only: [:show, :edit, :update, :destroy]

  # get "/trips/:trip_id/users", to: "trip_users#index"

  get "/areas/:area_id/trips/:trip_id/users/new", to: "trip_users#new"
  get "/areas/:area_id/trips/new", to: "trips#new"
  post "/users/:user_id/trips/new", to: "trips#create"
  post "/trips/:trip_id/users", to: "trip_users#create"
  patch "/trips/:trip_id/users", to: "trip_users#update"

  get "/trips/:trip_id/items", to: "trip_item#new"
end
