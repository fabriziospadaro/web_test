Rails.application.routes.draw do
  devise_for :admins
  root to: "pages#home",as: "home"
  
  get 'reserve', to: 'pages#reserve'
  post 'send_reservation', to: 'pages#send_reservation'
  get "index/:category", to: "items#index", as: "item_category"

  resources :items do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
  resources :ingredients
end
