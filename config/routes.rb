Rails.application.routes.draw do

  get 'json', to: 'points#json'
  get 'webhook_create', to: 'points#webhook_create'
  
  resources :points
  
  root 'welcome#index'
end
