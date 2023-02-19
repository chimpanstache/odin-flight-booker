Rails.application.routes.draw do
  resources :information
  resources :flights
  root to: "airports#index"
  
  devise_for :users
  resources :airports
  resources :billings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end