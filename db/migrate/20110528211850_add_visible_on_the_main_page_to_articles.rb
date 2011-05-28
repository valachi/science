class AddVisibleOnTheMainPageToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :visible, :boolean, :default => false
  end

  def self.down
    remove_column :articles, :visible
  end
end
