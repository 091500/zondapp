Rails.application.routes.draw do

  get 'json', to: 'points#json'
  
  resources :points
  
  root 'welcome#index'
end
