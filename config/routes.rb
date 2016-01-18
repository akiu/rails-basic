Rails.application.routes.draw do
  
  resources :users
  resources :sessions
  resources :secrets

  root 'home#index'
end
