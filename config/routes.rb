Rails.application.routes.draw do
  
  devise_for :users do
  end
  
  resources :users, only: [:show] do
    resources :items, only: [:new, :create]
  end
  
  get 'items/create'
  
  get 'users/show'

  get 'welcome/index'

  root 'welcome#index'
  
end
