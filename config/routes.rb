Rails.application.routes.draw do

  root to: "top#index"
  resources :items, only: [:index,:new, :show,:edit,:destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  }
  resources :items, only: [:new, :show,:create]
  resources :users, only: [:new]

    devise_scope :user do
  # 新規登録関連のパス
    get 'jp/signup' => 'users/registrations#index'
    get 'jp/signup/registration' => 'users/registrations#new'
    post 'jp/signup/registration' => 'users/registrations#create'
    get 'jp/signup/address' => 'users/registrations#address'
    patch 'jp/signup/address' => 'users/registrations#address_create'
    get 'jp/signup/complete' => 'users/registrations#registration_complete'
  # ログイン関連のパス
    get 'jp/login' => 'users/sessions#new'
    post 'jp/login' => 'users/sessions#create'
    end
end
