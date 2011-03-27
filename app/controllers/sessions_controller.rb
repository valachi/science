# encoding: utf-8

class SessionsController < InheritedResources::Base

  actions = :new, :create

  def new
    destroy if current_user
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Ты только что залогинился как #{user.email}"
    else
      flash.now.alert = "Неправильная пара password - email"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Вы только что разлогинились"
  end

end
