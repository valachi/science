Science::Application.routes.draw do
  
  resources :articles, :users, :sessions
  root :to => "articles#index"
  match "feed" => "articles#feed", :as => 'feed', :defaults => { :format => 'rss' }

  match 'category/:category' => "articles#index", :as => 'articles_from_category', :constraints => { :category => /(technology|world|gadgets|cosmos)/ }

  match "admin" => "sessions#new"
  match "log_out" => "sessions#destroy"
  match 'all_articles' => 'articles#as_dict'

end
