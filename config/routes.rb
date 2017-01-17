Rails.application.routes.draw do
  root 'home#show'

  get '/browse', to: 'home#index', as: :browse
  resources :home, only: [:index, :show]

  get '/dashboard', to: 'users#show', as: :dashboard
  resources :users
  resources :items
  resources :favorites

  resources :upvotes
  get '/login', to: 'sessions#new', as: :signup
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
