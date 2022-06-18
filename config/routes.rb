Rails.application.routes.draw do
  root to: 'contacts#index'

  get 'contact/index'
end