require 'rails_helper'

RSpec.describe Bot, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:bots_interactions) }
  it { should have_many(:interactions).through(:bots_interactions) }

  it { should validate_presence_of :name}
  it { should validate_presence_of :gender}
  it { should validate_presence_of :eye_color}
  it { should validate_presence_of :hair_color}
  it { should validate_presence_of :age}
  it { should validate_numericality_of(:age) }
  it { should validate_numericality_of(:age).is_less_than_or_equal_to(99) }
  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(18) }
  it { should validate_presence_of :user_id }

  it { should have_valid(:age).when("34") }
  it { should_not have_valid(:age).when(nil, "", 12, 204) }

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user_id: user.id) }

  before(:each) do
    Bot.create(
      name: 'Louisa',
      gender: "Female",
      eye_color: "Green",
      hair_color: "Blonde",
      age: 26,
      user: user
    )

    interaction1 = Interaction.create(
      category: "Sentence",
      sentence: "You are great",
      response: "I have a great teacher",
      user: user

    )

    interaction2 = Interaction.create(
      category: "Sentence",
      sentence: "I want a bike",
      response: "I think you should get one",
      user: user
    )

    interaction3 = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: 'cars',
      response: 'I like cars too',
      user: user
    )

    interaction4 = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: "bikes",
      response: "I love bikes but I prefer cars",
      user: user
    )

    interaction5 = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: "bikes",
      keyword2: "cars",
      response: "I prefer cars",
      user: user
    )

    interaction6 = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: "chicken",
      keyword2: "pork",
      response: "I love pork but I prefer chicken",
      user: user
    )

    BotsInteraction.create(
      bot: bot,
      interaction: interaction1
    )

    BotsInteraction.create(
      bot: bot,
      interaction: interaction2
    )

    BotsInteraction.create(
      bot: bot,
      interaction: interaction3
    )

    BotsInteraction.create(
      bot: bot,
      interaction: interaction4
    )

    BotsInteraction.create(
      bot: bot,
      interaction: interaction5
    )

    BotsInteraction.create(
      bot: bot,
      interaction: interaction6
    )

  end

  scenario "the right_answer method should return the right answer for a sentence" do
    message = "You are great"
    expect(bot.right_answer(message)).to eq("I have a great teacher")
  end

  scenario "the right_answer method should return the right answer for a keyword" do
    message = "What do you think about cars?"
    expect(bot.right_answer(message)).to eq("I like cars too")
  end

  scenario "the right_answer method should return the right answer for a combo" do
    message = "What do you think about cars and bikes?"
    expect(bot.right_answer(message)).to eq("I prefer cars")
  end
end
