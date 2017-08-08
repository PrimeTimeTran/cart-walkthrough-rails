Rails.application.routes.draw do
  get 'pages/index'

  resources :line_items
  resources :food_items
  resources :orders
  # POST /carts/add
  post "carts/add"
  get "/cart" => "carts#show"

  get "menu" => "menu#index"
  get "contact_us" => "home#contact_us"
  # root "home#index"
  root 'pages#index'
end
