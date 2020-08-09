Rails.application.routes.draw do
  scope '(:locale)', locale: /en|es/ do
    root to: 'homes#index'
    devise_for :users do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

    resources :categories
    resources :clients
    resources :suppliers

    get 'shared/tables', controller: :shared, action: :tables

  end
end
