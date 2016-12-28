Rails.application.routes.draw do
  root 'home#show'

  resources :home, only: [:index, :show]
end
