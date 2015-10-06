require "rails_helper"

feature "user sees list of interactions for a bot", %{
  As a user
  I want to see the list of interactions for a specific bot
  So that I can see its vocabulary

  Acceptance Criteria
  [X] I shouldnt see any table unless I click on one of the buttons
  [X] I must see only the sentences table if I click on the sentences button
  [X] I must see only the keywords table if I click on the keywords button
  [X] I must see only the combo table if I click on the combo button

} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user: user) }

  before(:each) do
    10.times do
      Interaction.create(
        category: "Sentence",
        sentence: Faker::Lorem.sentence,
        response: Faker::Lorem.sentence
      )
      BotsInteraction.create(bot: bot, interaction: Interaction.last)

      Interaction.create(
        category: "Keyword",
        sentiment: "Positive",
        keyword1: Faker::Lorem.word,
        response: Faker::Lorem.sentence,
      )
      BotsInteraction.create(bot: bot, interaction: Interaction.last)

      Interaction.create(
        category: "Combo",
        sentiment: "Positive",
        keyword1: Faker::Lorem.word,
        keyword2: Faker::Lorem.word,
        response: Faker::Lorem.sentence,
      )
      BotsInteraction.create(bot: bot, interaction: Interaction.last)
    end
  end

  scenario "user doesnt see any table unless he clicks on a button " do

    visit user_bot_path(user, bot)
    page.has_css?("sentences row text-center hidden")
    page.has_css?("keywords row text-center hidden")
    page.has_css?("combo row text-center hidden")
  end

  scenario "user sees sentences table" do
    visit user_bot_path(user, bot)
    choose("r1")
    expect(page).to have_content(bot.interactions.first.sentence)
    expect(page).to have_content(bot.interactions.first.response)
    expect(page).to have_content(bot.interactions.second.sentence)
    expect(page).to have_content(bot.interactions.second.response)
    page.has_css?("sentences row text-center")
    page.has_css?("keywords row text-center hidden")
    page.has_css?("combo row text-center hidden")
  end

  scenario "user sees keywords table" do
    visit user_bot_path(user, bot)
    choose("r1")
    expect(page).to have_content(bot.interactions.first.sentence)
    expect(page).to have_content(bot.interactions.first.response)
    expect(page).to have_content(bot.interactions.second.sentence)
    expect(page).to have_content(bot.interactions.second.response)
    page.has_css?("sentences row text-center hidden")
    page.has_css?("keywords row text-center")
    page.has_css?("combo row text-center hidden")
  end

  scenario "user sees combo table" do
    visit user_bot_path(user, bot)
    choose("r1")
    expect(page).to have_content(bot.interactions.first.sentence)
    expect(page).to have_content(bot.interactions.first.response)
    expect(page).to have_content(bot.interactions.second.sentence)
    expect(page).to have_content(bot.interactions.second.response)
    page.has_css?("sentences row text-center hidden")
    page.has_css?("keywords row text-center hidden")
    page.has_css?("combo row text-center")
  end
end
