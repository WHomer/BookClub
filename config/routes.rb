Rails.application.routes.draw do
  get '/', to: "books#index"

  resources :books, only: [:index, :show, :destroy]
  resources :authors, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show]
  resources :reviews, only: [:destroy]
end
