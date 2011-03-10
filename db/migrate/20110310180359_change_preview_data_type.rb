class ChangePreviewDataType < ActiveRecord::Migration
  def self.up
    change_column :articles, :preview, :text
  end

  def self.down
    change_column :articles, :preview, :string
  end
end
