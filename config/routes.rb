Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'
  resources :token
  resources :invoices
  resources :purchase_orders
end
