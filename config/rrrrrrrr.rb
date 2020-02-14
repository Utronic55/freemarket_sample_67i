resources :items, only [:index, :new, :create, :show, :edit, :update, :destroy] do
  collection do
    get 'saling_show'
    get 'saled_show'
    get 'children_category', defaults: { format: 'json'}
    post 'pay/:id' => 'items#pay' , as: 'pay'
    post 'pay', to: 'items#pay'
  end
  member do
    get 'before_buy'
  end
  
end