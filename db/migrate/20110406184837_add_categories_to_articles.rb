class AddCategoriesToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :category, :string
  end

  def self.down
    remove_column :articles, :category, :string
  end
end
