Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root "items#index"

  # スプリントレビューのためにitem_showを一時的に設定しています
  resources :items do
    collection do
      get 'item_show'
    end
  end

  # 本当はitemにネストする感じだと思いますが、スプリントレビューのため一時的にここに設定。
  resources :purchases
  resources :credit_cards

  resources :users do
    collection do
      get 'credit_register'
      get 'logout'
    end
  end
end
