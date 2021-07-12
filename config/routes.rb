Rails.application.routes.draw do
  get "", to: "application#index"
  namespace :api do
    namespace :v1 do
      resources :swaps
      resources :offers
      post 'swaps/searchSwap', to: 'swaps#search'
      post 'offers/withdrawCurrentUserOffers', to: 'offers#withdraw_current_user_offers'
      post 'offers/withdrawOtherUserOffers', to: 'offers#withdraw_other_user_offers'
      post 'offers/rejectOffers', to: 'offers#reject'
      get "notifications", to: "notifications#index"
      patch "notifications/markAsRead", to: "notifications#mark_as_read" 
      post "notifications", to: "notifications#create"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
end
