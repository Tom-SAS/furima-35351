Rails.application.routes.draw do
  get 'products/new'
  get 'products/index'
  devise_for :users
  
  root to: 'products#index'
  resources :products

end
