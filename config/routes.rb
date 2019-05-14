Rails.application.routes.draw do
  get '/books', to: "books#index"
  get '/books/:id', to: "books#show"
  get '/authors', to: "authors#index"
  get '/authors/:id', to: "authors#show"
end
