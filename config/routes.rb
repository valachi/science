Science::Application.routes.draw do
  resources :articles

  match ':controller(/:action(/:id(.:format)))'
  root :to => "articles#index"
end
