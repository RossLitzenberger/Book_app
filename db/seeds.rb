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
  :first_name => 'Ross',
  :last_name => 'Litzenberger',
  :email => 'ross@bookapp.com',
  :password => 'topsecret',
  :password_confirmation => 'topsecret',
  :id => 1
)

99.times do
  Book.create!(
    :book_name => Faker::Book.title,
    :author => Faker::Book.author,
    :description =>Faker::Lorem.paragraphs(15), 
    :illustator => Faker::Name.name,
    :cover => Faker::Placeholdit.image("300x300", 'png'),
    :user_id => rand(1..100),
    :created_at => Faker::Time.between(2.days.ago, Time.now, :all)
  )
  User.create!(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :password => Faker::Internet.password
  )
end



Book.create!(
:created_at => Faker::Time.forward(23, :morning) ,
:book_name => "friendslife",
:author => "gotte&sorr",
:description =>Faker::Lorem.paragraphs(15), 
:illustator => "sc21",
:user_id => 1)

Book.create!(
:created_at => Faker::Time.forward(23, :morning) ,
:book_name => "friendslife",
:author => "gotte&sorr",
:description =>Faker::Lorem.paragraphs(15), 
:user_id => 1)

puts "#{Book.count}" + "#{User.count}"
