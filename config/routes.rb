Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'complete', to: 'users/registrations#complete' 
  end
  root "products#index"
  resources "purchases", only:[:index,:new,:show] do
    member do
      get 'confirm'
    end
  end
  

  

  resources :card, only: [:index]
  resources :card, only: [:new, :show] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :products, only: [:index, :new, :create, :show, :destroy] do

    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'delete'
    end
  end

  resources "categorys", only: [:index]

  resources 'users', only: [:show]

  get '/logout', to: "users#logout"

  resources "signup", only: [:index, :create]

end