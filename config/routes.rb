Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :games
  end

  get '/community_games', to: 'games#community', as: 'community_games'
  root 'library#index'
end
