Rails.application.routes.draw do
  root to: 'urls#index'
  get "/:short_url", to: "urls#show"
  get "shortened/:short_url", to: "urls#shortened", as: :shortened
  resources :urls, only: :create
end
