# encoding: utf-8

class Article < ActiveRecord::Base
  belongs_to :user
  has_friendly_id :permalink, :use_slug => true
  
  default_scope :order => "articles.created_at DESC"  

  validates :title, :presence => true, :uniqueness => true
  validates :preview, :presence => true, :uniqueness => true
  validates :text, :presence => true, :uniqueness => true, :length => {:within => 10..1000000}
  validates :permalink, :presence => true, :uniqueness => true

  def self.as_dictionary
    dictionary = Hash.new {|hash, key| hash[key] = [] }
 
    Article.all.each do |p|
      dictionary[p.title[ 0]] << p
    end
 
    dictionary.sort
  end

end
