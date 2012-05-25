class Authorization < ActiveRecord::Base
  belongs_to :user

  validates :provider, :presence => true, :uniqueness => {:scope => [:provider, :uid]}
  validates :uid, :presence => true

  validates :token, :presence => true

  def self.find_for_authorization(resource, data)
    #check if any authorization with same provider and uid exists. if so just update the token
    auth = resource.authorizations.where({:provider => data[:provider], :uid => data[:uid]})
    if auth.blank?
      auth = resource.authorizations.create(data)
    end
  end
end
