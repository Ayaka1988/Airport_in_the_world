Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #ユーザー用
  #URL/users/sign_in...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  #URL /admins/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    session: "admin/sessions"
  }

  #ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  #admin側のルーティング
  namespace :admin do
    root to: "homes#top"
    resources :posts
    resources :genres
    resources :users
    resources :comments
  end

  #user側のルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about' => "homes#about"
    resources :chats, only: [:create, :destroy, :show]
    resources :rooms
    get 'user_rooms/:id' => 'user_rooms#show', as: 'user_room'


    resources :genres
    resources :posters, only: [:show]
    resources :contacts, only: [:new, :create]
    get '/posts/country' => 'posts#country', as: 'country_index'
    resources :posts  do
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      collection do
      get "search"
      end
    end

    # resources :users
    resources :users, only: [:show] do
      member do
      get :bookmarks
      get :posted
      get :mychat
      get :follow, :followings, :followers
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end


    get  '/users/:id' => 'users#show', as: 'user_mypage'
    get  '/users/:id/edit' => 'users#edit', as: 'mypage_edit'
    patch 'users/:id' =>  'users#update', as: 'mypage_update'
    #退会確認画面
    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    #論理削除のルーティング
    patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

    get 'get_genre/children', to: 'posts#get_genre_children', defaults: { format: 'json' }
    get 'get_genre/grandchildren', to: 'posts#get_genre_grandchildren', defaults: { format: 'json' }
  end



# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
