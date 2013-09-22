CrmPersonalAccount::Application.routes.draw do
 
  root to: 'contracts#index'
  devise_for :contracts 
  resources :contracts, only: [:index] do
    collection do
      get 'status'
      post 'update_contract'
      post 'change_status'
    end
    member do
      get 'balance'
    end
  end
end
