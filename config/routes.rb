Rails.application.routes.draw do
  devise_for :consumers
  root to: 'products#index'
  # resources :consumers 
  resources :products
end
