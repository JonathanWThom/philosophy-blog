Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :posts
  get "/dashboard", to: "dashboard#index"
  resources :users, only: [:index]
  resources :about, only: [:index]
  resources :books
end
