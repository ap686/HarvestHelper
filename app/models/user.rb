class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         #:recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body
    validates :email, :password, :first_name, :last_name,
              presence: true
              
  has_many :garden_devices
  has_many :posts
  has_many :comments
  
  def get_full_name
    first = self.first_name
    last = self.last_name
    first + " " + last rescue nil
  end
  
  def get_first_name
    self.first_name rescue nil
  end
  
  def get_last_name
    self.last_name rescue nil
  end
end
