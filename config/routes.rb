Rails.application.routes.draw do
  # route for Home
  root to: 'pages#home'

  # routes for authentication process
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for users
  resources :users

  resources :nanny_offers

  resources :bookings
end
