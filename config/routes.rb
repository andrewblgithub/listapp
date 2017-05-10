Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
    resources :lists do
       resources :posts do
       resources :comments
          member do
             put "like", to: "posts#like"
             put "unlike", to: "posts#unlike"
          end
    end
  end
  resources :tags
  # Define Root URL
     root 'pages#index'
     get '/help' => 'pages#help'
     get '/all' => 'pages#all'
     get '/most_likes' => 'pages#most_likes'
     get '/completed' => 'pages#completed'
     get '/users' => 'pages#users'
     get '/created_by_me' => 'pages#created_by_me'
     get '/lists/:id/posts' => 'lists#index'
end
