Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
  }

  namespace :admin do
  root :to => 'homes#top'

  # users
  get 'users/index' => 'users#index'

  # industries
  resources :industries, only: [:index, :create, :edit, :update]
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
  patch 'users/withdraw' => 'users#withdraw'

  # posts
  post 'posts/confirm' => 'posts#confirm'
  post 'posts/back' => 'posts#back'
  post 'posts/complete' => 'posts#complete'
  resources :posts, only: [:new, :index, :show, :edit, :update] do

  # commets 親のresourcesであるpostsにネストする
  resources :comments, only: [:create, :destroy]

  end

  # searches
  get '/search', to: 'searches#search'

  end


end
