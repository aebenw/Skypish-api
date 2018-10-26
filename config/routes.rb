Rails.application.routes.draw do
  resources :videos, only: [:create]
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  resources :users, only: [:show, :index, :create]
  mount ActionCable.server => '/cable'

  post  '/followers', to: 'users#followers'
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'


end
