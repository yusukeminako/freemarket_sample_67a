Rails.application.routes.draw do
  # devise_for :users
  root to: "posts#index"
  #root 'test#index_new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "test", only: [:index]
  resources "categorys", only: [:index]
end