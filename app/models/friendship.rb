class Friendship < ActiveRecord::Base
  include Amistad::FriendshipModel

  searchable do
    integer :id
    integer :user_id
    integer :friend_id
    boolean :pending





  end
end
