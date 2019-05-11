Rails.application.routes.draw do
  get '/', to: "bookclub#index"

  resources :authors, only: [:show]
end
