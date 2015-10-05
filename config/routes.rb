Rails.application.routes.draw do

  root 'homes#index'
  devise_for :users, path: 'accounts'

  resources :users, only: [:show, :index] do
      resources :bots
  end
end
