Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  root "items#index"

  # スプリントレビューのためにitem_showを一時的に設定しています
  resources :items do
    collection do
      get 'item_show'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchases, only: :show do
      collection do
        post 'pay'
        get 'complete'
      end
    end
  end
  resources :users do
    collection do
      get 'credit_register'
      get 'logout'
    end
  end
  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
