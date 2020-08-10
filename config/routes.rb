Rails.application.routes.draw do
  # setup for the json api
  devise_for :users, 
    :controllers => { 
      sessions: 'sessions', 
      registrations: 'registrations'
    }

  devise_scope :user do
    get 'users/install', :to => 'registrations#install'
    get 'users/welcome', :to => 'registrations#welcome'
  end

  # api routes for browser extension
  post 'api/authenticate', to: 'api/authentication#authenticate'
  get 'api/highlights/current' => 'api/highlights#current', :as => :current, :format => 'json'
  post 'api/highlights', to: 'api/highlights#create'

  # landing page for marketing
  root to: 'marketing#index'
  get 'editor', :to => 'marketing#editor'
  get 'extension', :to => 'marketing#extension'

  get 'home', :to => 'home#index'

  resources :highlights
  resources :sources, only: [:index, :show, :new, :create, :destroy]
  resources :notes
  resources :tags
  resources :assortments
  resources :projects
  resources :documents
end
