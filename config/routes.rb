Rails.application.routes.draw do

  get 'dashboard/index' => 'dashboard#index'

  devise_for :users
  root 'home#index'
  
  resources :users, only: [:show]
  resources :spots, except: [:edit] do
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
