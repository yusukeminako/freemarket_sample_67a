Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "categorys", only: [:index]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3' 
      get 'done' 
    end
  end
end