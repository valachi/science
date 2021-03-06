require 'digest'
class User < ActiveRecord::Base
  has_many :articles  
  
  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validate :password, :presence => true, :confirmation => true, :length => {:within => 5..25}, :if => :password
  validate :email, :presence => true, :uniqueness => true, :format => {:with => email_regex }
  validate :username, :presence => true, :uniqueness => true, :length => {:within => 3..15}
  
  before_save :encrypt_password

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.hashed_password == Digest::SHA2.hexdigest("#{password}, #{user.salt_password}")
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
