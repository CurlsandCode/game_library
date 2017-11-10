Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }


  resources :games do
    resources :screenshots, only: [:create, :show, :destroy, :index]
    resources :comments
  end

  resources :users, only: [:show]

  get '/completed_games', to: 'users#user_completed'
  get '/user_screenshots', to: 'users#screenshots'
  root 'library#index'
end
