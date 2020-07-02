Rails.application.routes.draw do
  resources :invoices, only: [:index, :create, :update, :destroy]
  resources :clients, only: [:index, :create, :update, :destroy]
  resources :tickets, only: [:index, :create, :update, :destroy]
  resources :couriers, only: [:index, :create, :update, :destroy]
  resources :users, only: [:index, :create, :update, :destroy, :show]
  resources :sessions, only: [:create, :destroy]

  get '/tickets/active', to: 'tickets#active'

  get '/tickets/paginate', to: 'tickets#paginate'

  get 'tickets/incomplete-unassigned', to: 'tickets#incomplete_unassigned'

  get '/tickets/search', to: 'tickets#search'

  get '/tickets/today', to: 'tickets#today'

  get '/couriers/incomplete/:courier_id', to: 'couriers#incomplete'

  get '/invoices/:id/mark-paid', to: 'invoices#mark_paid'

  get '/clients/:id/invoices', to: 'clients#invoices'

  get '/invoices/unpaid', to: 'invoices#unpaid'

end
