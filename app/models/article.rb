class Article < ActiveRecord::Base
  belongs_to :user
  has_friendly_id :permalink, :use_slug => true
  
  default_scope :order => "articles.created_at DESC"  

  validates :title, :presence => true, :uniqueness => true
  validates :preview, :presence => true, :uniqueness => true
  validates :text, :presence => true, :uniqueness => true, :length => {:within => 10..1000000}
  validates :permalink, :presence => true, :uniqueness => true
end
