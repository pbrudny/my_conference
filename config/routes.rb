Rails.application.routes.draw do
  resources :donates
  get 'static_pages/main'
  get 'static_pages/schedule'

  resources :users
  root 'static_pages#main'
end