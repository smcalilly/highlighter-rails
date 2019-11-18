Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  post 'authenticate', to: 'authentication#authenticate'

  root to: "highlights#index"
  
  resources :highlights
end
