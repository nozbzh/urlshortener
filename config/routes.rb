Rails.application.routes.draw do
  root to: 'urls#index'
  get "/:short_url", to: "urls#show"
  resources :urls, only: [:create, :edit]
end
