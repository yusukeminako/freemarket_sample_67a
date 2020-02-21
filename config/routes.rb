Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'complete', to: 'users/registrations#complete' 
    get 'address', to: 'users/registrations#address'
    post 'address_create', to: 'users/registrations#address_create'
  end
  root "products#index"

  resources :card, only: [:new, :show,:index] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'delete', to: 'products#delete'
    end
  end


  resources :purchases, only: [:show] do
    collection do
      post 'buy/:id', to: 'purchases#buy', as: 'buy'
      get 'done', to: 'purchases#done'
    end
  end

  get '/images/:id', to: "images#destroy"


  get '/logout', to: "users#logout"
  resources "signup", only: [:index, :create]
  resources "categorys", only: [:index]

  resources "users", only: [:show]
end
