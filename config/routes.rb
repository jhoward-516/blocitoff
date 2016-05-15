Rails.application.routes.draw do
  get 'users/index'
  
  get 'users/show'

  get 'welcome/index'

  devise_for :users
  
  root 'welcome#index'
  
end
