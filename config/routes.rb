Rails.application.routes.draw do
  scope '(:locale)', locale: /en|es/ do
    root to: 'homes#index'
    devise_for :users

    resources :categories
    resources :clients
    resources :providers

    get 'shared/tables', controller: :shared, action: :tables

  end
end
