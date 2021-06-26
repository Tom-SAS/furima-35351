Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  
  root to: 'products#index'
  resources :products, only:[:new, :create] do
    resources :user_products, only:[:new]
  end

end
