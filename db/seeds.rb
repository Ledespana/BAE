User.create(
  email: "ledespana@gmail.com",
  username: "Admin",
  password: "923138334",
  phone_number: Faker::Number.number(10),
  gender: "Male",
  role: "Admin"
)

User.create(
  email: "pablo.ledesma.p@gmail.com",
  username: "Pablo",
  password: "923138334",
  phone_number: Faker::Number.number(10),
  gender: "Male",
)
12.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Name.first_name,
    password: Faker::Internet.password(8),
    phone_number: Faker::Number.number(10),
    gender: "Male",
    )
end

Bot.create(
  name: "Louisa",
  gender: "Female",
  eye_color: "Green",
  hair_color: "Blonde",
  age: 26,
  user_id: User.last.id
)
#Sentences

Interaction.create(
  category: "Sentence",
  sentence: "i love how you understand me",
  response: "it's not easy but I have fun",
  user_id: User.last.id
)

Interaction.create(
  category: "Sentence",
  sentence: "i promise",
  response: "great :)",
  user_id: User.last.id
)

Interaction.create(
  category: "Sentence",
  sentence: "i love how well you understand me",
  response: "it's not easy but I have fun",
  user_id: User.last.id
)

Interaction.create(
  category: "Keyword",
  sentiment: "Positive",
  keyword1: "bike",
  response: "You deserve it. Promise me you will think about getting one",
  user_id: User.last.id
)

Interaction.create(
  category: "Keyword",
  sentiment: "Negative",
  keyword1: "bike",
  response: "Yes, I don't like bikes either :S",
  user_id: User.last.id
)

Interaction.create(
  category: "Combo",
  sentiment: "Positive",
  keyword1: "bike",
  keyword2: "car",
  response: "You deserve at least a bike. Promise me you will think about getting one",
  user_id: User.last.id
)

Interaction.create(
  category: "Combo",
  sentiment: "Negative",
  keyword1: "bike",
  keyword2: "car",
  response: "I know they are awful",
  user_id: User.last.id
)
