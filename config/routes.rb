Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'accounts#show', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :accounts, only: :show do
    resources :account_transactions, only: :index
    resources :deposits, only: :create
    resources :withdrawls, only: :create
    resources :transfer_outs, only: :create
  end
  
end
