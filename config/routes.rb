Rails.application.routes.draw do
  devise_for :users
  resources "signup", only: [:new]
root to: "posts#index"
resources "products", only: [:index]
  resources "card", only: [:new, :show]
  resources "test", only: [:index, :new]
  resources "categorys", only: [:index]
  resources "users", only: [:index, :new]
  resources "signup", only: [:new]
  resources :card, only: [:index, :new, :show] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destroy'
    end
  end
end