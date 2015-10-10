require "rails_helper"

feature "user adds interactions to bot", %{
  As a user
  I want to add an interaction to my bot from my vocabulary
  So the bot can have more interactions

} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user: user) }

  scenario "user adds a sentence to his bot" do
    login(user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence,
      user_id: user.id
    )
    visit user_interactions_path(user)
    choose("r1")
    click_on "Add"
    expect(page).to have_content("Interaction added to #{bot.name}!")
  end

  scenario "user adds a keyword to his bot" do
    login(user)
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
      user_id: user.id
    )
    visit user_interactions_path(user)
    choose("r2")
    click_on "Add"
    expect(page).to have_content("Interaction added to #{bot.name}!")
  end

  scenario "user adds a combo to his bot" do
    login(user)
    interaction = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
      user_id: user.id
    )
    visit user_interactions_path(user)
    choose("r3")
    click_on "Add"
    expect(page).to have_content("Interaction added to #{bot.name}!")
  end
end
