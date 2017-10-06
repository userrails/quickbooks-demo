Rails.application.routes.draw do
  root 'vendors#index'

  resources :vendors
  resources :settings, only: [] do
    collection do
      get :authenticate
      get :oauth_callback
      get :bluedot
    end
  end

  get '/disconnect', to: 'settings#disconnect'
end
