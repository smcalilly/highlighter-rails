Rails.application.routes.draw do
  
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  post 'authenticate', to: 'authentication#authenticate'

  root to: 'marketing#home'
  get '/user' => "highlights#index", :as => :user_root
  
  resources :highlights
  resources :sources, only: [:index, :show, :new, :create, :destroy]
end
