class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  attr_accessible :impact, :review

  validates :review, :presence => true
  validates :impact, :presence => true
end
