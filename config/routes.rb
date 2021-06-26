Rails.application.routes.draw do
  get "", to: "application#index"
  namespace :api do
    namespace :v1 do
      resources :swaps
      resources :offers
      post 'searchSwap', to: 'swaps#search'
      post 'withdrawOffer', to: 'offers#withdraw'
      post 'searchMultiple', to: 'swaps#showSwap'
      post 'rejectOffers', to: 'offers#reject'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
end
