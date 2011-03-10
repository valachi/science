class SessionsController < InheritedResources::Base
  actions = :new, :create, :show

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end
 

end
