CrmPersonalAccount::Application.routes.draw do

  root to: 'contracts#index'

  mount EcconnectRails::Engine => "/ecconnect_rails", :as => "ecconnect"

  devise_for :contracts 
  resources :monexyes, only: [:index] do
    collection do
      get 'success'
      get 'failure'
    end
  end
  resources :contracts, only: [:index] do
    collection do
      post 'update_contract'
      post 'change_status'
    end
    member do
      get 'status'
      get 'balance'
      get 'payment'
    end
  end
end
