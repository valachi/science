class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :load_sidebar_data, :strip_www

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def load_sidebar_data
    @sidebar_offers = Article.limit(10).all
      if params[:category]
        @sidebar_offers = Article.where(category: params[:category]).limit(10)
      end
  end

  def strip_www
    if /^www/.match(request.host)
      redirect_to request.protocol + request.host_with_port[4..-1] + request.request_uri, :status => 301
    end
  end
end
