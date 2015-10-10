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
      user_id: User.last.id
    )

    20.times do
      Interaction.create(
        category: "Sentence",
        sentence: Faker::Lorem.sentence,
        response: Faker::Lorem.sentence,
        user_id: User.last.id
      )

      BotsInteraction.create(
        bot: Bot.last,
        interaction: Interaction.last
      )

      Interaction.create(
        category: "Keyword",
        sentiment: "Positive",
        keyword1: Faker::Lorem.word,
        response: Faker::Lorem.sentence,
        user_id: User.last.id

      )

      BotsInteraction.create(
        bot: Bot.last,
        interaction: Interaction.last
      )

      Interaction.create(
        category: "Combo",
        sentiment: "Positive",
        keyword1: Faker::Lorem.word,
        keyword2: Faker::Lorem.word,
        response: Faker::Lorem.sentence,
        user_id: User.last.id

      )

      BotsInteraction.create(
        bot: Bot.last,
        interaction: Interaction.last
      )
    end
  end
end
