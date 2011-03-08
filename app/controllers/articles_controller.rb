class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end  
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to root_path
  end

end
