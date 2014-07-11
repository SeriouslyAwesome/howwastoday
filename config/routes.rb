Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :create]
  root to: 'visitors#index'
end
