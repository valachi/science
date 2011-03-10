class UsersController < InheritedResources::Base
  actions = :new, :create   

  def create
    create!{ root_path }
  end

end
