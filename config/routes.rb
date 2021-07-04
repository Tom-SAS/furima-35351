Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  
  root to: 'products#index'
  resources :products, only:[:new, :create, :show, :edit, :update, :delete] do
        resources :user_products, only:[:index, :create]
  end


end
