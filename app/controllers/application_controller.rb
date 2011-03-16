class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

    def current_user
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_user=(user)
      @current_user = user
    end

end
