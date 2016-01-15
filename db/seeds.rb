# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all
User.destroy_all

User.create!(
  :email => 'ross@bookapp.com',
  :password => 'topsecret',
  :password_confirmation => 'topsecret',
  :id => 1
)

99.times do
  Book.create!(
    :created_at => Faker::Time.between(2.days.ago, Time.now, :all),
    :book_name => Faker::Book.title,
    :author => Faker::Book.author,
    :illustator => Faker::Name.name,
    :cover => Faker::Placeholdit.image("300x300", 'png'),
    :user_id => rand(1..100)
  )
  User.create!(
    :email => Faker::Internet.email,
    :password => Faker::Internet.password
  )
end



Book.create!(
:created_at => Faker::Time.forward(23, :morning) ,
:book_name => "friendslife",
:author => "gotte&sorr",
:illustator => "sc21",
:user_id => 1)

Book.create!(
:created_at => Faker::Time.forward(23, :morning) ,
:book_name => "friendslife",
:author => "gotte&sorr",
:user_id => 1)

puts "#{Book.count}" + "#{User.count}"
