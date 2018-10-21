Rails.application.routes.draw do
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'

  root 'conversations#index'
  #lets see if this works now
end
