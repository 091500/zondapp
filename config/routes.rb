Rails.application.routes.draw do

  get 'json', to: 'points#json'
  get 'webhook_create', to: 'points#webhook_create'
  post 'search', to: 'points#search'
  
  resources :points, only: [:index, :create, :destroy]
  
  root 'welcome#index'
end
