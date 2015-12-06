Rails.application.routes.draw do
  resources :products, except: [:show]

  root to: "products#index"
end
