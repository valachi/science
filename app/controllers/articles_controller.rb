# encoding: utf-8

class ArticlesController < InheritedResources::Base
  before_filter :must_be_admin, :except => [:show, :index]

  def index
    @articles = Article.page(params[:page]).per(5)
    if params[:category]
       @articles = Article.where(:category => params[:category]).page(params[:page]).per(5)
       @title = "Все статьи категории #{(params[:category]).capitalize}"
    end
  end
  
  def show
    show!{@title = @article.title}
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

  def feed
    @articles = Articles.all(:select => "title, preview, id, created_at", :order => "created_at DESC", :limit => 20)

    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
  end    

  private

  def must_be_admin
    unless current_user
      redirect_to root_path, :alert => "Пшел вон!"
    end
  end
end
