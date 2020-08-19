Rails.application.routes.draw do
  devise_for :consumers
  resources :items, only: [:index, :new, :show, :edit]
end
