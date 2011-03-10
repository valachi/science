class Article < ActiveRecord::Base
  belongs_to :user
  
  default_scope :order => "articles.created_at ASC"  

  validates :title, :presence => true, :uniqueness => true
  validates :preview, :presence => true, :uniqueness => true
  validates :text, :presence => true, :uniqueness => true, :length => {:within => 10..1000000}
  validates :permalink, :presence => true, :uniqueness => true
end
