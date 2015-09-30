Rails.application.routes.draw do

  root 'homes#index'
  devise_for :users, path: 'accounts'

  resources :users, only: [:show] do
      resources :bots
  end
end
