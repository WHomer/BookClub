Rails.application.routes.draw do
  get '/', to: "books#index"

  resources :books, only: [:index, :show, :destroy, :new, :create]
  resources :authors, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :reviews, only: [:destroy, :new, :create]
end
