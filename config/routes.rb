Rails.application.routes.draw do
  resources :bookings, only: [:show, :new, :create]
  resources :flights, only: [:index]
  root to: 'flights#index'

  resources :airports, only: [:index, :new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
