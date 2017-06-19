Rails.application.routes.draw do
  get 'static_pages/main'
  get 'static_pages/about'

  resources :users
  root 'static_pages#main'
end