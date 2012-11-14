class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  has_many :garden_devices
  
  before_save { |user| user.email = email.downcase }
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, 
              presence: true,
              length: { maximum: 50 }
  validates :email, 
              presence: true,
              format: { with: EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  validates :password,
              presence: true,
              length: { minimum: 5 }
  validates :password_confirmation,
              presence: true
end
