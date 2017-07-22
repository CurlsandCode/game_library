Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :games do
    resources :screenshots, only: [:create, :show]
  end

  resources :users, only: [:show]

  get '/community_games', to: 'games#community', as: 'community_games'
  root 'library#index'
end
