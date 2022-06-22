Rails.application.routes.draw do
  root to: 'contacts#index'
  get 'contacts/index', as: 'contacts'
  get 'contacts/new', as: 'new_contact'
  post 'contacts/create'
end