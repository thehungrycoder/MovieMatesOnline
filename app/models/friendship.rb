class Friendship < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  validates :user_id, :presence => true
  validates :friend_id, :presence => true

  scope :accepted, where({:status => :accepted})
  scope :pending, where({:status => :pending})
end
