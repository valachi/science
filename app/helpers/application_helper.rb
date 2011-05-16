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

  #Подчеркиваем в меню нужную категорию когда params[:category], передавя списку li класс
  def put_class(string)
    " class=active" if params[:category] == string
  end

  #Выводим заголовок над сайдбаром
  def put_sidebar_category
    " категории #{I18n.t params[:category]}" if params[:category]
  end

end
