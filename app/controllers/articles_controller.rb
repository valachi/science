# encoding: utf-8

class ArticlesController < InheritedResources::Base
  before_filter :must_be_admin, :except => [:show, :index, :feed]

  def index
    @articles = Article.where(:visible => true).page(params[:page]).per(5) #pagination Kaminari
    if params[:category]
       @articles = Article.where(:category => params[:category]).page(params[:page]).per(5) #pagination Kaminari
       @title = "#{(I18n.t params[:category])} - все самое интересное"
    end
  end

  def show
    show!{@title = @article.title}
  end

  def new
    new! do |format| 
      format.html { render :layout => 'admin_layout' }
    end
  end

  def create
    create!(:notice => "Новая статья успешно создана и добавлена в ленту!")
  end

  def edit
    edit! do |format|
      format.html { render layout: 'admin_layout' }
    end
  end

  def update
    update!(:notice => "Статья отредактирована успешно!")
  end

  def destroy
    destroy!(:notice => "Статья была успешно удалена")
  end

  def feed
        
    @articles = Article.where(visible: true)

    respond_to do |format|
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
