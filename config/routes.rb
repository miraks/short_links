Rails.application.routes.draw do
  root 'home#index'

  resources :short_links, only: [:create]
  resources :short_links, path: 's', only: [:show]
end
