Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  root to: 'home#index'

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/home', to: 'home#index', as: :home
  
  resources :contacts, except: [:show] do
    get 'autocomplete', on: :collection
  end

  post "/groups", to: "groups#create"
end