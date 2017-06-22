Rails.application.routes.draw do
  resources :donates
  get 'static_pages/main'
  get 'static_pages/schedule'
  get 'static_pages/details'
  get 'static_pages/contact'

  resources :users
  root 'static_pages#main'
end