Rails.application.routes.draw do
  post 'spots/:id/edit' => 'spots#edit'
  delete 'spot/:id' => 'spots#destroy'
  devise_for :users
  authenticate :user do
    root 'dashboard#index'
  end
  get '/home' => 'home#index'
  post 'spots/new' => 'spots#create'

  resources :bookings
  resources :users, only: [:show]
  resources :spots do
    resources :availabilities
    member do
      get 'street'
      get 'city'
      get 'zip'
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
