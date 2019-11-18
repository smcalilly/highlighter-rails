Rails.application.routes.draw do
  devise_for :users
  root to: "highlights#index"
  resources :highlights
end
