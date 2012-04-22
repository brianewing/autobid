Auto::Application.routes.draw do
  root :to => 'site#index'

  resources :dealers
  resources :cars
  resources :auctions
  
  match 'logout', :to => 'site#logout', :as => 'logout'
  post 'login', :to => 'site#login', :as => 'login'
end
