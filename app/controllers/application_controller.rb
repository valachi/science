class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :load_sidebar_data
  before_filter :ensure_domain

  APP_DOMAIN = 'scione.ru'

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def load_sidebar_data
    @sidebar_offers = Article.limit(10).all
      if params[:category]
        @sidebar_offers = Article.where(:category => params[:category]).limit(10)
      end
  end

  def ensure_domain
    if request.env['HTTP_HOST'] == "www.#{APP_DOMAIN}/#{params[:path]}"
      redirect_to "http://#{APP_DOMAIN}/#{params[:path]}", :status => 301
    end
  end
end
