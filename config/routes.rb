Rails.application.routes.draw do
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'animals/index'
  # get 'animals/show'
  # get 'animals/new'
  # get 'animals/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  resources :animals, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :destroy]
  get "/your_animal/:id", to: "animals#your_animal", as: :your_animal
  get "/your_bookings", to: "bookings#index", as: :your_bookings
end
