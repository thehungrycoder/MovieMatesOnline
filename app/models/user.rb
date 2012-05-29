class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable, :reconfirmable, :encryptable,
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  RESERVED_NAMES = %w(admin super superuser root administrator admins god allah)
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :name, :avatar_url, :location

  validates :username, :presence => true, :uniqueness => true, :exclusion => {:in => RESERVED_NAMES}
  has_many :reviews
  has_many :authorizations, :dependent => :destroy

  include Amistad::FriendModel

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = self.find_by_email(data.email)
      user
    else # Create a user with a stub password.
      self.create(
        :email => data.email,
        :password => Devise.friendly_token[0, 20],
        :confirmed_at => Time.now,
        :name => data.name,
        :avatar_url => access_token.info.image,
        :location => data.location[:name],
      )
    end
  end


end
