Rails.application.routes.draw do
  resources :vendors
  root 'vendors#index'

  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end
end
