Rails.application.routes.draw do
  resources :groups
  resources :expenses
  devise_for :users, path: ''
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
end
