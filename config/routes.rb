Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :edit, :show, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :edit,:show,  :create, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  scope module: :public do
    resources :orders, only: [:index, :show, :create, :new]
    post 'orders/info/comfirm/' => 'orders#comfirm'
    get 'orders/info/thanks' => 'orders#thanks'
  end
  scope module: :public do
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/dlete/destroy_all' => 'cart_items#destroy_all'
  end
  scope module: :public do
    resource :customers, only: [:show]
    get 'customers/unsubscribe'
    get 'customers/edit/info' => 'customers#edit'
    delete 'customers/destroy' => 'customers#destroy'
    patch 'customers/update/info' => 'customers#update'
  end
  scope module: :public do
    resources :items, only: [:index, :show]

  end
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
