Rails.application.routes.draw do
  get 'static_pages/main'
  get 'static_pages/schedule'

  resources :users
  root 'static_pages#main'
end