Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }


  resources :games do
    resources :screenshots, only: [:create, :show, :destroy]
  end

  resources :users, only: [:show]

  get '/completed_games', to: 'users#user_completed'
  root 'library#index'
end
