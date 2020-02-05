Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  root to: "posts#index"
  resources "test", only: [:index]
  resources "categorys", only: [:index]
  resources "users", only: [:index, :new]
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end

