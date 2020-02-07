Rails.application.routes.draw do
root to: "posts#index"
  resources "card", only: [:new, :show]
  resources "test", only: [:index, :new]
  resources "categorys", only: [:index]
  resources "users", only: [:index, :new]
  resources :card, only: [:index, :new, :show] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destroy'
    end
  end
end
