Rails.application.routes.draw do
  resources :images
  resources :comments
  resources :posts
  resources :categories
  resources :areas
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ##########################################################
  # user: login & signup & logout
  get "/users", to: "users#index"
  get "/users/ping", to: "users#ping"
  post '/users/login', to: "users#login"
  post '/users/register', to: "users#register"
  post '/users/logout', to: "users#logout"

  #########################################################
  # posts 
  get '/user_posts', to: 'posts#user_posts' #get current user's posts
  get '/local_posts/:zipcode', to: 'posts#local_posts' #get local posts based on user's zipcode

end
