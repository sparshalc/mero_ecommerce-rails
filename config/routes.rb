Rails.application.routes.draw do
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/destroy'
  get 'categories/mens_fashion'
  get 'categories/womens_fashion'
  get 'categories/electronics'
  get 'categories/other'
  root 'home#index'
  resources :admin,only: [:index, :destroy]
  resources :products do
    resources :comments
  end
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
end
