50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  profile_image = "nil"
  User.create!(name: name,
               email: email,
               password: password,
               profile_image: nil,
               )
end
