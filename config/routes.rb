Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  resources :items, only: [:index, :new]
  
  root to: "items#index"
  
end