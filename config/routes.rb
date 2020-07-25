Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users

  resources :categories
  resources :clients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'shared/tables', controller: :shared, action: :tables
end
