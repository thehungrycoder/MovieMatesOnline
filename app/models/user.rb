class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable, :reconfirmable, :encryptable,
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at

  has_many :reviews
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = self.find_by_email(data.email)
      user
    else # Create a user with a stub password.
      self.create(
        :email => data.email,
        :password => Devise.friendly_token[0, 20],
        :confirmed_at => Time.now
      )
    end
  end

end
