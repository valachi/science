class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.string :preview
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
