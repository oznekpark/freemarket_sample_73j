Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  resources :users do
    collection do
      get 'credit_register'
      get 'logout'
    end
  end
end
