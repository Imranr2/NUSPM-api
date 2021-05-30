Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :swaps
      get 'module_swaps', to: 'swaps#module_swaps'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
end
