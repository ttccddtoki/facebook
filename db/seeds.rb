# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  user = User.create!(
              name: name,
              email: email,
               password: password,
               password_confirmation: password,
               provider: "provider#{n+1}",
               )
  user.skip_confirmation!
  user.save!
end


10.times do |n|

  rand_id = 0

  until User.find_by_id(rand_id) != nil do
    rand_id = rand(1..150)
  end

image_path = File.join(Rails.root, "app/assets/images/NYK_00055.jpg")

   Picture.create!(
    image: File.new(image_path),
    user_id: rand_id
  )
end
