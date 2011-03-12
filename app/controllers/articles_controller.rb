class ArticlesController < InheritedResources::Base
  def create
    create!(:notice => "Your article was successfully created")
  end

  def update
    update!(:notice => "Successfully updated")
  end

  def destroy
    destroy!(:notice => "You have just destroyed an one very good article")
  end
end
