Rails.application.routes.draw do
  root to: 'urls#index'
  get "/:id", to: "urls#show"
  resources :urls, only: [:create, :edit]
end
