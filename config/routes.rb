Rails.application.routes.draw do
  root to: "texts#index"
  resources :texts, only: [:index, :show]
  resources :movies, only: :index
end
