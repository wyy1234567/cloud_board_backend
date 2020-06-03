Rails.application.routes.draw do
  resources :images
  resources :comments
  resources :posts
  resources :categories
  resources :areas
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
