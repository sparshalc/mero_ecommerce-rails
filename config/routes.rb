Rails.application.routes.draw do
  root 'home#index'
  resources :admin,only: [:index, :destroy]
  resources :products
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
end
