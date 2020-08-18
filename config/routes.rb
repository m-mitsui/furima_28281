Rails.application.routes.draw do
  resources :items, only: [:index, :new, :show, :edit]
end
