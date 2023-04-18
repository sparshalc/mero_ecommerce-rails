Rails.application.routes.draw do
  resources :admin
  root 'home#index'
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
end
