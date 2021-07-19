Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  resources :users, only: :show
  resources :words, only: [ :index, :create, :destroy, :edit, :update ]
end
