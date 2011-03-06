class Article < ActiveRecord::Base
  
  default_scope :order => "articles.created_at ASC"  

  validates :title, :presence => true, :uniqueness => true
  validates :preview, :presence => true, :uniqueness => true
  validates :text, :presence => true, :uniqueness => true
  validates :permalink, :presence => true, :uniqueness => true
end
