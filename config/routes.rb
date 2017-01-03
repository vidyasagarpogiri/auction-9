Rails.application.routes.draw do
  root 'home#show'

  get '/browse', to: 'home#index', as: :browse
  resources :home, only: [:index, :show]

  resources :users

  resources :upvotes
  get '/login', to: 'sessions#new', as: :signup
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
