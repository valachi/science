class SessionsController < InheritedResources::Base

  actions = :new, :create

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "You've just logged in as #{user.email}"
    else
      flash.now.alert = "Invalid password or email"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You just logged out"
  end

end
