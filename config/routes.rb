Rails.application.routes.draw do
  
  devise_for :users do
  end
  
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy] do
      put :toggle
    end
  end
  
  root 'welcome#index'
  
end
