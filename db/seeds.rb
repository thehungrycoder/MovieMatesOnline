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
User.find_or_create_by_email({
  :name => 'Raju',
  :email => 'rajuru@gmail.com',
  :password => 'common',
  :confirmed_at => Time.now,
})


(1..20).each do |index|
  User.find_or_create_by_email({
    :name => "Raju RU #{index}",
    :email => "rajuru#{index}@gmail.com",
    :password => 'common',
    :confirmed_at => Time.now,
  })
end

require_relative 'seedable/movie'

