Rails.application.routes.draw do

  root to: "top#index"
  resources :items, only: [:index,:new, :show,:create,:edit,:destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :mypages, only: [:index, :new]   

  resources :credits, only: [:new, :create, :show] do
    collection do
      post 'delete', to: 'credits#delete'
      post 'show'
    end
    member do
      get 'confirmation'
    end
    end 

    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end

  root to: "top#index"
  resources :users, only: [:index,:new]
   
end
