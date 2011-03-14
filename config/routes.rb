Science::Application.routes.draw do

  resources :articles
  resources :users
  resources :sessions

  get "sign_up" => "users#new"
  get "admin" => "sessions#new"
  get "log_out" => "sessions#destroy"

  match ':controller(/:action(/:id(.:format)))'
  root :to => "articles#index"
end
