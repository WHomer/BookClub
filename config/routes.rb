Rails.application.routes.draw do
  get '/', to: "books#index"

  resources :books, only: [:index, :show]
  resources :authors, only: [:show]
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]
end
