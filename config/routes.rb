Rails.application.routes.draw do

  devise_for :admins
  # 管理者
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :places, only: [:new, :edit, :create, :update, :destroy]
    resources :festival_names, only: [:new, :edit, :create, :update, :destroy]
    resources :festivals, only: [:new, :index, :edit, :create, :update, :destroy]
    get 'festivals/autocomplete_festival_name/:term' => 'festivals#autocomplete_festival_name'
    get 'festivals/autocomplete_place/:term' => 'festivals#autocomplete_place'
  end

  # ユーザー
    devise_for :users
    get 'users/:id/exit' => 'users#exit', as: 'exit'
    get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
    post 'memories/:id' => 'memories#create', as: 'memories_create'
    post 'recommends/:id' => 'recommends#create', as: 'recommends_create'

    root to: 'articles#index'
    get 'homes/about' => 'homes#about'
    mount ActionCable.server => '/cable'
    resources :recommends, only: [:new, :index, :update, :destroy]
    resources :memories, only: [:new, :index, :update, :destroy]
    resources :find_friends, only: [:create, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :festivals, only: [:index]
    resources :follows, only: [:index, :create, :destroy]
    resources :rooms, only: [:show, :create]
    resources :homes, only: [:about]
    resources :favorites, only: [:index]
    delete 'favorites/destroy_all' => 'favorites#destroy_all', as: 'destroy_all'

    resources :festivals, only: [:index] do
    resources :favorites, only: [:create, :destroy]
  end
end