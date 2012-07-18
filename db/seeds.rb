# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! do |user|
  user.full_name             = 'Logan Trujillo'
  user.email                 = 'sublime7767@yahoo.com'
  user.password              = 'foobar'
  user.password_confirmation = 'foobar'
end

Category.create!(title: 'Business')
Category.create!(title: 'Personal')
Category.create!(title: 'Lady Gaga')
Category.create!(title: 'Short Pants')
Category.create!(title: 'Artest')
