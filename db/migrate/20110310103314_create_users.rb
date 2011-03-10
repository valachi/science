class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :hashed_password
      t.string :salt_password

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
