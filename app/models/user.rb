require 'digest'
class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :password, :presence => true, :confirmation => true, :length => {:within => 5..25}
  validates :email, :presence => true, :uniqueness => true, :format => {:with => email_regex }
  validates :username, :presence => true, :uniqueness => true, :length => {:within => 3..15}
  
  before_save :encrypt_password

  private

  def encrypt_password
    self.salt_password = make_salt if new_record?
    self.hashed_password = encrypt
  end

  def make_salt
    Digest::SHA2.hexdigest("#{username} + #{email}")
  end

  def encrypt
    Digest::SHA2.hexdigest("#{password} + #{salt_password}")
  end


end
