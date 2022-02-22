Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'animals/index'
  get 'animals/show'
  get 'animals/new'
  get 'animals/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
end
