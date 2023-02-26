Rails.application.routes.draw do
  resources :bookings
  resources :flights
  root to: 'flights#index'

  devise_for :users
  resources :airports
  resources :billings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
