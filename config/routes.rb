Rails.application.routes.draw do

resources :data_pages

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
  get '/world' => "homes#world"
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

end


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

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
