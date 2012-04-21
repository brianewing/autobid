Auto::Application.routes.draw do
  root :to => 'site#index'

  resources :dealers
end
