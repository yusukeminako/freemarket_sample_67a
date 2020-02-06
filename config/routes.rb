Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "test", only: [:index, :new]
  resources "categorys", only: [:index]
end