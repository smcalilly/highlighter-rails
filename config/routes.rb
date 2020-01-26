Rails.application.routes.draw do
  # setup for the json api
  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations' }
  post 'authenticate', to: 'authentication#authenticate'

  # landing page for marketing
  root to: 'marketing#home'

  
  #get '/user' => "highlights#index", :as => :user_root

  # authenticated :user do
  #   root :to => "highlights#index"
  # end
  
  resources :highlights
  resources :sources, only: [:index, :show, :new, :create, :destroy]
end
