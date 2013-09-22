CrmPersonalAccount::Application.routes.draw do
 
  root to: 'contracts#index'
  devise_for :contracts 
  resources :contracts, only: [:index] do
  	get 'balance', on: :collection
  	get 'status', on: :collection
  end
end
