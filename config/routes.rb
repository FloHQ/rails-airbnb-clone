Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  # route for Home
  root to: 'pages#home'

  # routes for authentication process
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

  resources :nanny_offers do
    resources :bookings, only: [:new, :create, :index, :show]
  end
end
