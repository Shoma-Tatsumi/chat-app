Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  root to: "rooms#index"

  resources :users, only: [:edit, :update]
  # 新規チャットルーム作成で動くアクションはnew, createのみ
  resources :rooms, only: [:new, :create] 
end
