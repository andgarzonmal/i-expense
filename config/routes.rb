Rails.application.routes.draw do
  devise_for :users, path: ''
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  resources :groups do
    resources :expenses
  end
  root "splash#index"
end
