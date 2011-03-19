class ArticlesController < InheritedResources::Base
  
  before_filter :must_be_admin, :except => [:show, :index]  

  def create
    create!(:notice => "Your article was successfully created")
  end

  def update
    update!(:notice => "Successfully updated")
  end

  def destroy
    destroy!(:notice => "You have just destroyed an one very good article")
  end

  def must_be_admin
    unless current_user
      redirect_to root_path, :alert => "Get away!"
    end
  end

end
