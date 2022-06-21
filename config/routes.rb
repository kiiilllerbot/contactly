Rails.application.routes.draw do
  root to: 'contacts#index'
  get 'contacts/index', as: 'contacts'
end