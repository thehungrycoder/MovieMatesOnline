class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable, :reconfirmable, :encryptable,
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at, :name, :avatar_url, :location

  has_many :reviews
  has_many :authorizations, :dependent => :destroy

  has_many :friendships
  has_many :friend, :through => :friendships

  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


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
