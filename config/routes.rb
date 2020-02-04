Rails.application.routes.draw do
  root to: "posts#index"
  resources "test", only: [:index]
  resources "categorys", only: [:index]
  resources "users", only: [:index, :new]
  #get 'categorys/create', to: 'categorys#create'
  #get 'categorys/new', to: 'categorys#new'
end

