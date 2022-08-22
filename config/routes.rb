Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :surfboards, except: ['update', 'edit'] do
    resources :bookings, only: ['new', 'create', 'destroy']
  end
  resources :bookings, only: 'index'
  get 'my_surfboards', to: 'surfboards#my_surfboards'
  get 'my_bookings', to: 'bookings#my_bookings'
end
