Rails.application.routes.draw do

  root to: "top#index"
  resources :items, only: [:index,:new, :show,:edit,:destroy] do
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


  root to: "top#index"

  resources :items, only: [:new, :show,:create]
  resources :users, only: [:index,:new]
   
end
