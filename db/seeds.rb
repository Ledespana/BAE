20.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Name.first_name,
    password: Faker::Internet.password(8),
    phone_number: Faker::Number.number(10),
    gender: "Male"
  )

  2.times do
    Bot.create(
      name: Faker::Name.first_name,
      gender: "Female",
      eye_color: "Green",
      hair_color: "Black",
      age: 26,
      user: User.last
    )

    20.times do
      Interaction.create(
        category: "sentence",
        sentence: Faker::Lorem.sentence,
        response: Faker::Lorem.sentence,
      )

      BotsInteraction.create(
        bot: Bot.last,
        interaction: Interaction.last
      )
    end
  end
end
