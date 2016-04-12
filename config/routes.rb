Rails.application.routes.draw do
  root to: 'pages#home'
  get "/:id", to: "urls#show"
  resources :urls, only: [:create, :edit]
end
