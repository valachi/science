class Article < ActiveRecord::Base
  belongs_to :user
  has_friendly_id :permalink, :use_slug => true
  
  default_scope :order => "articles.created_at DESC"  

  validate :title, :presence => true, :uniqueness => true
  validate :preview, :presence => true, :uniqueness => true
  validate :text, :presence => true, :uniqueness => true, :length => {:within => 10..1000000}
  validate :permalink, :presence => true, :uniqueness => true
end
