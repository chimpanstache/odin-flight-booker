Rails.application.routes.draw do
  resources :bookings
  resources :flights, only: [:index]
  root to: 'flights#index'

  resource :users
  resources :airports
  resources :billings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
