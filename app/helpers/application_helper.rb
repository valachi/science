# encoding: utf-8

module ApplicationHelper
  
  def title
    base_title = "Scione: наука, популярная механика, космос и многое другое"
    if @title.nil?
      base_title
    else
      "#{@title} | Scione.ru"
    end
  end

  def put_class(string)
    " class=active" if params[:category] == string
  end

end
