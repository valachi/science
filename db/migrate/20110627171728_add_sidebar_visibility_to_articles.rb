class AddSidebarVisibilityToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :sidebar_visible, :boolean, :default  => true
  end

  def self.down
    remove_column :articles, :sidebar_visible
  end
end
