class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :omniauth_providers => [:facebook]
         #:recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :provider, :uid
  
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
  
  def to_s
   get_full_name
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(first_name:auth.extra.raw_info.first_name,
                          last_name:auth.extra.raw_info.last_name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
