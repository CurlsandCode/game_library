Rails.application.routes.draw do
  devise_for :users
  root 'library#index'
end
