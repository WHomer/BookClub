Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]
end
