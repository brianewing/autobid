Auto::Application.routes.draw do
  root :to => 'site#index'

  resources :dealers
  match 'logout', :to => 'site#logout', :as => 'logout'
end
