# encoding: utf-8

class ArticlesController < InheritedResources::Base
  before_filter :must_be_admin, :except => [:show, :index]

  def index
    @articles = Article.page(params[:page]).per(5)
  end

  def create
    create!(:notice => "Новая статья успешно создана и добавлена в ленту!")
  end

  def update
    update!(:notice => "Статья отредактирована успешно!")
  end

  def destroy
    destroy!(:notice => "Статья была успешно удалена")
  end

  def must_be_admin
    unless current_user
      redirect_to root_path, :alert => "Пшел вон!"
    end
  end

end
