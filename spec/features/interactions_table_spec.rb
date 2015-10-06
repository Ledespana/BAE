# require "rails_helper"
#
# feature "user sees list of interactions for a bot", %{
#   As a user
#   I want to see the list of interactions for a specific bot
#   So that I can see its vocabulary
#
#   Acceptance Criteria
#   [ ] I must see all the interactions for a bot
#   [ ] I can choose to see different ones depending of the category.
#   [ ] I must see be able to search and find a sentence
#   [ ] I must see be able to search and find a keyword
#   [ ] I must see be able to search and find a combination of keywords
#
# } do
#   let!(:user) { FactoryGirl.create(:user) }
#   let!(:bot) { FactoryGirl.create(:bot, user: user)}
#
#   before(:each) do
#     10.times do
#       Interaction.create(
#         category: "Sentence",
#         sentence: Faker::Lorem.sentence,
#         response: Faker::Lorem.sentence
#       )
#       BotsInteraction.create(bot: bot, interaction: Interaction.last)
#
#       Interaction.create(
#         category: "Keyword",
#         sentiment: "Positive",
#         keyword1: Faker::Lorem.word,
#         response: Faker::Lorem.sentence,
#       )
#       BotsInteraction.create(bot: bot, interaction: Interaction.last)
#
#       Interaction.create(
#         category: "Combo",
#         sentiment: "Positive",
#         keyword1: Faker::Lorem.word,
#         keyword2: Faker::Lorem.word,
#         response: Faker::Lorem.sentence,
#       )
#       BotsInteraction.create(bot: bot, interaction: Interaction.last)
#     end
#   end
#
#   scenario "user sees table with interactions on a bot show page" do
#     visit user_bot_path(user, bot)
#     expect(page).to have_content(bot.interactions.first.response)
#     expect(page).to have_content(bot.interactions.second.response)
#   end
#
#   scenario "user can search for a specific sentence" do
#     interaction = Interaction.create(
#       category: "Sentence",
#       sentence: "How are you doing?",
#       response: "I'm great!"
#     )
#     BotsInteraction.create(bot: bot, interaction: interaction)
#     visit user_bot_path(user, bot)
#     within('#panel-2') do
#       fill_in "Search Sentence", with: "How are you doing?"
#       click_button "Search"
#     end
#     expect(page).to have_content(interaction.response)
#   end
#
#   scenario "user can search for a specific keyword" do
#     interaction = Interaction.create(
#       sentiment: "Positive",
#       category: "Keyword",
#       keyword1: "cars",
#       response: "I don't understand about cars but I love when you drive one"
#     )
#     BotsInteraction.create(bot: bot, interaction: interaction)
#     visit user_bot_path(user, bot)
#     within('#panel-3') do
#       fill_in "Search Keyword", with: "cars"
#       click_button "Search"
#     end
#     expect(page).to have_content(interaction.response)
#   end
#
#   scenario "user can search for a specific combination of keywords" do
#     interaction = Interaction.create(
#       sentiment: "Positive",
#       category: "Keyword",
#       keyword1: "cars",
#       keyword2: "motorbikes",
#       response: "I think you should get a motorbike"
#     )
#     BotsInteraction.create(bot: bot, interaction: interaction)
#     visit user_bot_path(user, bot)
#     within('#panel-4') do
#       fill_in "Keyword1", with: "cars"
#       fill_in "Keyword2", with: "motorbikes"
#       click_button "Search"
#     end
#     expect(page).to have_content(interaction.response)
#   end
# end
