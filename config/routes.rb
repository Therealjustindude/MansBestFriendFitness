Rails.application.routes.draw do
  resources :users
  resources :dogs
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "site#index"
end
