Rails.application.routes.draw do
  resources :donates do
    member do
      get 'set_received'
    end
  end
  get 'static_pages/main'
  get 'static_pages/schedule'
  get 'static_pages/support'
  get 'static_pages/contact'
  get 'static_pages/faq'

  resources :users
  root 'static_pages#main'
end