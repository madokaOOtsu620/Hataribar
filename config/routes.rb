Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
  }

  namespace :admin do
  root :to => 'homes#top'

  # users
  resources :users, only: [:index, :edit, :update]

  # posts
  resources :posts, only: [:show, :destroy] do

  # comments
  resources :comments, only: [:destroy]

  end

  # industries
  resources :industries, only: [:index, :create, :edit, :update, :destroy]

  end



  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
  root :to => 'homes#top'

  # users
  get 'users' => 'users#show', as: 'mypage'
  get 'users/information/edit' => 'users#edit', as: 'mypage_edit'
  patch 'users/information' => 'users#update'
  get 'users/confirm' => 'users#confirm'
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user'

  # posts
  # get 'posts/new' => 'posts#new'
  # post 'posts/confirm' => 'posts#confirm'
  # post 'posts/back' => 'posts#back'
  # post 'posts/complete' => 'posts#complete'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do

  # bookmarks
  resource :bookmarks, only: [:create, :destroy]

  # commets 親のresourcesであるpostsにネストする
  resources :comments, only: [:create, :destroy]

  end

  # bookmarks一覧ページ
  get 'bookmarks' => 'bookmarks#index'

  # searches
  get '/search', to: 'searches#search'

  # industries
  resources :industries, only: [:show]

  end


end
