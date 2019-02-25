Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :speeches, only: %i[index show] do
    resources :contributions, only: :create
  end

  resources :contributions, only: %i[update destroy] do
    resources :votes, only: %i[upvote downvote]
    resources :comments, only: :create
  end

  resources :comments, only: %i[update destroy] do
    resources :votes, only: %i[upvote downvote]
  end

  resources :speakers, only: :show

  resources :users, only: :show

  get :profile, to: 'users#profile'

  namespace :admin do
    resources :speeches, only: %i[new create edit update destroy]
    resources :speakers, only: %i[new create edit update destroy]
  end
end
