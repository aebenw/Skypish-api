Rails.application.routes.draw do
  # get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :messages
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  resources :users, only: [:show, :index, :create]
  mount ActionCable.server => '/cable'

end
