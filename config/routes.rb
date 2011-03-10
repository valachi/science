Science::Application.routes.draw do

  resources :articles
  resources :users
  resources :sessions

  get "sign_up" => "users#new"
  get "log_in" => "sessions#new"

  match ':controller(/:action(/:id(.:format)))'
  root :to => "articles#index"
end
