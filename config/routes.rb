Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  root to: "rooms#index"

  resources :users, only: [:edit, :update]
  # 新規チャットルーム作成で動くアクションはnew, createのみ
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create] #メッセージ送信機能にindex・createが必要,どのルームで投稿されたメッセージかパスから判断したい→ルーティングのネスト
  end
end
