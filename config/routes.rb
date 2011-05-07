Science::Application.routes.draw do
  
  resources :articles, :users, :sessions
  root :to => "articles#index"

  match 'category/:category' => "articles#index", :as => 'articles_from_category', :constraints => { :category => /(technology|science|gadgets|cosmos)/ }

  match "admin" => "sessions#new"
  match "log_out" => "sessions#destroy"
  match "feed" => 'articles#feed', :as => :feed, :defaults => { :format => 'rss' }

end
