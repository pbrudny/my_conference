Rails.application.routes.draw do
  resources :mailings do
    member { get 'send_to_all' }
    member { get 'send_to_selected' }
  end
  resources :stats, only: :index

  resources :waiting_users
  resources :categories
  resources :questions do
    collection { get 'qa' }
  end
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

  resources :users do
    member { put 'select' }
    collection { get 'unselect' }
  end
  root 'static_pages#main'
end