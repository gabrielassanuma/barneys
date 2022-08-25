Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :surfboards, except: ['update', 'edit'] do
    resources :bookings, only: ['new', 'create', 'destroy']
  end
  resources :bookings, only: 'show'
  get 'my_surfboards', to: 'surfboards#my_surfboards'
  get 'my_bookings', to: 'bookings#my_bookings'
end
