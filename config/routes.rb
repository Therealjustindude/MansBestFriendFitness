Rails.application.routes.draw do
  
  root "site#index"
  
  devise_for :users, path: "accounts"

  resources :users, only: [:index, :show] do
    resources :dogs
  end
  
  
end
