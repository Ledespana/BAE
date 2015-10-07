Rails.application.routes.draw do

  root 'homes#index'
  devise_for :users, path: 'accounts'

  resources :users, only: [:show, :index] do
    resources :bots, only: [:show]
  end

  resources :bots, except: [:show, :index]

  resources :users, only: [:none] do
    resources :interactions, only: [:index, :new, :create, :update, :destroy]
  end

end
