Science::Application.routes.draw do

  resources :articles
  resources :users

  get "sign_up" => "users#new"

  match ':controller(/:action(/:id(.:format)))'
  root :to => "articles#index"
end
