Rails.application.routes.draw do

  devise_for :users
  resources :games
  resources :users, only: [:show] 

  get '/community_games', to: 'games#community', as: 'community_games'
  root 'library#index'
end
