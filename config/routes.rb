Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :speeches, only: %i[index show] do
    resources :contributions, only: :create
  end

  resources :contributions, only: %i[update destroy] do
    get :upvote, to: 'votes#upvote'
    get :downvote, to: 'votes#downvote'
    resources :comments, only: :create
  end

  resources :comments, only: %i[update destroy] do
    get :upvote, to: 'votes#upvote'
    get :downvote, to: 'votes#downvote'
  end

  resources :speakers, only: :show

  resources :users, only: :show

  get :profile, to: 'users#profile'

  authenticate :user, lambda { |u| u.admin } do
    namespace :admin do
      resources :speeches, only: %i[index show new create edit update destroy]
      resources :speakers, only: %i[index show new create edit update destroy]
    end
  end
end
