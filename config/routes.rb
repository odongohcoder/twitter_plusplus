Rails.application.routes.draw do

  devise_for :users
  resource :tweets

  root to: 'application#index'

  get '/timeline', to: 'tweets#index', as: :user_root
  get '/timeline/follow/:id', to: 'tweets#follow', as: :timeline_follow_user
  get '/timeline/unfollow/:id', to: 'tweets#unfollow', as: :timeline_unfollow_user

  get '/user/follow/:id', to: 'users#follow', as: :user_follow
  get '/user/unfollow/:id', to: 'users#unfollow', as: :user_unfollow


  get '/tweets/search', to:'tweets#search', as: :tweets_search
  get '/users/search', to:'users#search', as: :users_search

  resources :users, only: :show do
    resources :relations, only: :index
  end
end
