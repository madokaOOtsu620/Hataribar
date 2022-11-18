Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
  root :to => 'public/homes#top'

  # users
  get 'users' => 'users#show', as: 'mypage'
  get 'users/information/edit' => 'users#edit', as: 'mypage_edit'
  patch 'users/information' => 'users#update'
  get 'users/confirm' => 'users#confirm'
  patch 'users/withdraw' => 'users#withdraw'

  # posts
  post 'posts/confirm' => 'posts#confirm'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update] do
    
  # commets 親のresourcesであるpostsにネストする
  resources :comments, only: [:create, :destroy]

  end


  end


end
