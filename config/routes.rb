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

  post 'authenticate', to: 'authentication#authenticate'

  # landing page for marketing
  root to: 'marketing#home'

  # don't know rails so i have to set this route
  get 'highlights/current' => 'highlights#current', :as => :current, :format => 'json'

  resources :highlights
  resources :sources, only: [:index, :show, :new, :create, :destroy]
  resources :notes
  resources :tags, only: [:index, :show]
end
