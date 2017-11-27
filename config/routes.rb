Rails.application.routes.draw do
  get 'nanny_offers/index'

  get 'nanny_offers/create'

  get 'nanny_offers/new'

  get 'nanny_offers/edit'

  get 'nanny_offers/show'

  get 'nanny_offers/update'

  get 'nanny_offers/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
