# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: "Admin Framiga",
  email: "framiga@email.com",
  password: "password",
  is_admin: true
)
25.times do |n|
  name = Faker::Name.name
  email = "user#{n+1}@mail.com"
  password = "password"
  User.create(
    name: name,
    email: email,
    password: password,
    is_admin: false
  )
end

users = User.all
user = users.first
following = users[2..25]
followers = users[3..15]
following.each{ |followed| user.follow(followed) }
followers.each{ |follower| follower.follow(user) }