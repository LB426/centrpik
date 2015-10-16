# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Andrey",
             family: "Seredin",
             otchestvo: "Konstantinovich",
             email: "odissey@rambler.ru",
             password:              "111111",
             password_confirmation: "111111",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  family = Faker::Name.first_name
  otchestvo = Faker::Name.last_name
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               family: family,
               otchestvo: otchestvo,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

end
