20.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Name.first_name,
    password: Faker::Internet.password(8),
    phone_number: Faker::Number.number(10),
    gender: 'Male'
    )
end
