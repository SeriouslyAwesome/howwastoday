Rails.application.routes.draw do
  resource :review, only: [:new, :create, :update]

  root to: 'reviews#new'
end
