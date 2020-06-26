Rails.application.routes.draw do
  resources :clients, only: [:index, :create, :update, :destroy]
  resources :tickets, only: [:index, :create, :update, :destroy]
  resources :couriers, only: [:index, :create, :update, :destroy]

  get '/tickets/active', to: 'tickets#active'

  get '/tickets/search', to: 'tickets#search'
end
