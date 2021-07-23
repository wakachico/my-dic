Rails.application.routes.draw do
  devise_for :users
  root to: "words#index"
  resources :users, only: :show
  resources :words, only: [ :index, :create, :destroy, :edit, :update ] do
    resources :goods, only: [:create, :destroy]
    
    member do
      get 'search_mydic'
    end
    collection do
      get 'search_index'
    end
    member do
      get 'order_mydic'
    end
    collection do
      get 'order_index'
    end
    collection do
      get 'weblio_pull'
    end
  end
end
