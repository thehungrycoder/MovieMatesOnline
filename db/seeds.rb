# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class User < ActiveRecord::Base
  attr_accessible :email, :password, :confirmed_at
end
User.create!({
  :email => 'rajuru@gmail.com',
  :password => 'common',
  :confirmed_at => Time.now,
})