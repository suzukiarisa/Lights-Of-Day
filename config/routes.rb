Rails.application.routes.draw do

# 管理者
    get 'favorites/index'
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :places, only: [:new, :edit, :create, :update, :destroy]
    resources :festival_names, only: [:new, :edit, :create, :update, :destroy]
    resources :festivals, only: [:new, :index, :edit, :create, :update, :destroy]
    get 'festivals/autocomplete_festival_name/:term' => 'festivals#autocomplete_festival_name'
    get 'festivals/autocomplete_place/:term' => 'festivals#autocomplete_place'
  end

  # ユーザー
    devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
    }

    get 'users/:id/exit' => 'users#exit', as: 'exit'
    get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
    get 'users/:id/post' => 'users#post', as: 'post'
    get 'users/index/result' => 'users#index_result', as: 'index_result'

    root to: 'tops#index'
    get 'homes/about' => 'homes#about'
    mount ActionCable.server => '/cable'
    resources :tops, only: [:index]
    resources :recommends, only: [:new, :index, :create, :update, :destroy]
    resources :memories, only: [:new, :index, :create, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update] do
        resource :user_relationship, only: [:create, :destroy]
    end
    resources :festivals, only: [:index]
    resources :follows, only: [:index, :create, :destroy]
    resources :rooms, only: [:show, :create]
    resources :homes, only: [:about]
    resources :favorites, only: [:index]
    delete 'favorites/destroy_all' => 'favorites#destroy_all', as: 'destroy_all'

    resources :festivals, only: [:index] do
        resource :favorite, only: [:create, :destroy]
  end
end