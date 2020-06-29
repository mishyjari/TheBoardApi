Rails.application.routes.draw do
  resources :clients, only: [:index, :create, :update, :destroy]
  resources :tickets, only: [:index, :create, :update, :destroy]
  resources :couriers, only: [:index, :create, :update, :destroy]
  resources :users, only: [:index, :create, :update, :destroy, :show]
  resources :sessions, only: [:create, :destroy]

  get '/tickets/active', to: 'tickets#active'

  get '/tickets/search', to: 'tickets#search'

  get '/tickets/today', to: 'tickets#today'
end
