Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get 'login', to: 'devise/session#new'
    get 'register', to: 'devise/registrations#new'
  end

  devise_for :users, path: 'auth',controllers: {registrations: :custom_registrations}, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root to: 'home#index'

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/home', to: 'home#index', as: :home
  
  resources :contacts, except: [:show] do
    get 'autocomplete', on: :collection
  end

  post "/groups", to: "groups#create"
end