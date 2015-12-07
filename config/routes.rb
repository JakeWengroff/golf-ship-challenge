Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index, :show, :create, :update, :destroy]
  end

  root to: "products#index"
end
