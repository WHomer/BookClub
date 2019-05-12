Rails.application.routes.draw do
  get '/', to: "books#index"
  get '/:id', to: "books#show"
end
