Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :authors, only: [:show]
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]
end
