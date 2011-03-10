require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :password, :presence => true, :confirmation => true, :length => {:within => 5..25}
  validates :email, :presence => true, :uniqueness => true, :format => {:with => email_regex }
  validates :username, :presence => true, :uniqueness => true, :length => {:within => 3..15}
  
  before_save :encrypt_password

  def self.authenticate
    user = User.find_by_email(email)
    if user && user.hashed_password == Digest::SHA2.hexdigest("#{user.password}, #{user.salt_password}")
      user
    else
      nil
    end
  end
      

  private

  def encrypt_password
    if password.present?
      self.salt_password = make_salt if new_record?
      self.hashed_password = encrypt(password)
    end
  end

  def make_salt
    Digest::SHA2.hexdigest("#{username} + #{email}")
  end

  def encrypt(string)
    Digest::SHA2.hexdigest("#{password}, #{salt_password}")
  end


end
