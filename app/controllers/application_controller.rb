class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :load_sidebar_data, :strip_www, :sape_init

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def load_sidebar_data
    @sidebar_offers = Article.where(sidebar_visible: true).limit(10).all
      if params[:category]
        @sidebar_offers = Article.where(category: params[:category], sidebar_visible: true).limit(10)
      end
  end

  def strip_www
    if /^www/.match(request.host)
      redirect_to request.protocol + request.host_with_port[4..-1] + request.request_uri, :status => 301
    end
  end

  def sape_init
    @sape = Sape.from_request('66f309030ae9aff9e2f4378ec9c3b378', request)
  end

end
