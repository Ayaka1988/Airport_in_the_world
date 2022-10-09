Rails.application.routes.draw do

  #ユーザー用
  #URL/users/sign_in...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  #URL /admins/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    session: "admin/sessions"
  }

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
    resources :genres
    resources :contacts, only: [:new, :create]
    resources :posts ,only: [:new, :create, :index, :show, :destroy, :update] do
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end

    # resources :users
    get  '/users/:id' => 'users#show', as: 'user_mypage'
    get  '/users/:id/edit' => 'users#edit', as: 'mypage_edit'
    patch 'users/:id' =>  'users#update', as: 'mypage_update'
    get '/users' => 'users#index' , as: 'users_post'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'

    #中間テーブル
    get 'get_genre/children', to: 'posts#get_genre_children', defaults: { format: 'json' }
    get 'get_genre/grandchildren', to: 'posts#get_genre_grandchildren', defaults: { format: 'json' }

    #contact
    get 'contacts/new'
    get 'contacts/create'
    resources :data_pages
  end






# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
