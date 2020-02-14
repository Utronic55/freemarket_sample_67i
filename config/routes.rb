Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end


  root to: "top#index"

  resources :items, only: [:new, :show]
  resources :users, only: [:new, :index]
  resources :mypages, only: [:index, :new] 

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  
  resources :credits, only: [:new, :create, :show] do
  collection do
    post 'delete', to: 'credits#delete'
    post 'show'
  end
  member do
    get 'confirmation'
  end
end 


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
