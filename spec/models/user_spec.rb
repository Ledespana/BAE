require "rails_helper"

RSpec.describe User, type: :model do

  it { should have_many(:bots) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_numericality_of(:phone_number) }
  it { should validate_length_of(:phone_number).is_equal_to(10) }

  it { should have_valid(:username).when("example-postink") }
  it { should_not have_valid(:username).when(nil, "") }

  it { should have_valid(:email).when("eu@inkedgorl.com") }
  it { should_not have_valid(:email).when(nil, "") }

  it { should have_valid(:gender).when("male") }
  it { should have_valid(:gender).when("female") }
  it { should_not have_valid(:gender).when(nil, "") }

  it { should have_valid(:phone_number).when(1234123123)}
  it { should_not have_valid(:phone_number).when(nil, "", 2331)}

  it "Total_vocabulary sould return the total of interactions of user's bots" do
    user = FactoryGirl.create(:user)
    bot1 = FactoryGirl.create(:bot, user: user)
    bot2 = FactoryGirl.create(:bot, user: user)
    10.times do
      Interaction.create(
        category: "Sentence",
        sentence: Faker::Lorem.sentence,
        response: Faker::Lorem.sentence
      )

      BotsInteraction.create(bot: bot1, interaction: Interaction.last)

      Interaction.create(
        category: "Keyword",
        keyword1: Faker::Lorem.word,
        response: Faker::Lorem.sentence
      )
      BotsInteraction.create(bot: bot2, interaction: Interaction.last)
    end
    expect(user.total_vocabulary).to eq(20)
  end
end
