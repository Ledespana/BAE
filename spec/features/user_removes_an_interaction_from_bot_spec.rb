require "rails_helper"

feature "user removes interactions from bot", %{
  As an authorized user
  I want to remove an interaction from my bot from my vocabulary
  So the bot won't use it anymore

} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user: user) }

  scenario "user removes a sentence to his bot" do
    login(user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence,
      user_id: user.id
    )
    BotsInteraction.create(
      bot: bot,
      interaction: interaction
    )

    visit user_interactions_path(user)
    choose("r1")
    click_on "Remove"
    expect(page).to have_content("Interaction removed successfully from #{bot.name}")
  end

  scenario "user removes a keyword to his bot" do
    login(user)
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
      user_id: user.id
    )
    BotsInteraction.create(
      bot: bot,
      interaction: interaction
    )

    visit user_interactions_path(user)
    choose("r2")
    click_on "Remove"
    expect(page).to have_content("Interaction removed successfully from #{bot.name}")
  end

  scenario "user removes a combo to his bot" do
    login(user)
    interaction = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
      user_id: user.id
    )
    BotsInteraction.create(
      bot: bot,
      interaction: interaction
    )

    visit user_interactions_path(user)
    choose("r3")
    click_on "Remove"
    expect(page).to have_content("Interaction removed successfully from #{bot.name}")
  end
end
