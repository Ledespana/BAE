Rails.application.routes.draw do
  devise_scope :user do
    get "/" => "devise/sessions#new"
  end
   devise_for :users, controllers: { registrations: "registrations" } 
   resources :users, only: [:show]
end
