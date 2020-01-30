Rails.application.routes.draw do
  resources "categorys", only: [:index]
end
