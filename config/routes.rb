Rails.application.routes.draw do
  get 'users/index'

  get 'welcome/index'

  devise_for :users
  root 'welcome#index'
end
