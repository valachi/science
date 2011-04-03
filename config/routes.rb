Science::Application.routes.draw do
  match 'category/:category' => "articles#index", :as => 'articles_from_category'

  resources :articles
  resources :users
  resources :sessions

  match "sign_up" => "users#new"
  match "admin" => "sessions#new"
  match "log_out" => "sessions#destroy"

  match ':controller(/:action(/:id(.:format)))'
  root :to => "articles#index"
end
