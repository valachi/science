# encoding: utf-8

class SessionsController < InheritedResources::Base

  actions = :new, :create

  def new
    @title = "Вход в административную панель"
    redirect_to(root_path) if current_user
    render layout: 'login_layout'
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Ты только что залогинился как #{user.email}"
    else
      flash.alert = "Не удалось выполнить вход"
      redirect_to "/admin"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Вы только что разлогинились"
  end

end
