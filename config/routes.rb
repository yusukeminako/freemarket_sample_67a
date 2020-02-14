Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources "products", only: [:index, :new] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources "card", only: [:new, :show]
  resources "categorys", only: [:index]
  resources 'users', only: [:show]
  get '/logout', to: "users#logout"
  resources "signup", only: [:new]
  resources "purchases", only:[:show]
  resources :card, only: [:index, :new, :show] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destroy'
    end
  end
end