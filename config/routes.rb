Rails.application.routes.draw do
  post 'spots/:id/edit' => 'spots#edit'
  delete 'spot/:id' => 'spots#destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :charges
  get 'dashboard/index' => 'dashboard#index'
  post 'notifications/notify_host'
  root 'home#index'
  post 'spots/new' => 'spots#create'
  resources :dashboard
  get 'dashboard/:id/show' => 'dashboard#show'
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
  get 'book_it' => "bookings#create"  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
