Auto::Application.routes.draw do
  root :to => 'site#index'

  resource :dealers
end
