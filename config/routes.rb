Rails.application.routes.draw do

  root 'homes#index'
  devise_for :users, path: 'accounts'

  resources :users, only: [:show, :index] do
    resources :bots, only: [:show]
  end

  resources :bots, except: [:show, :index] do
    resources :interactions, only: [:new, :create, :update, :destroy]
  end
end
