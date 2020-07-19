Rails.application.routes.draw do
  
  root "site#index"
  
  devise_for :users,controllers: { omniauth_callbacks: 'omniauth_callbacks' }, path: "accounts"

  resources :users, only: [:index, :show] do
    resources :dogs do
      resources :journal_entries
      resources :exercise_entries
      resources :diet_entries
    end
  end
 

  
  
end
