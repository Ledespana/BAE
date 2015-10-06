require "rails_helper"

feature "user deletes a bots", %{
  As an authenticated user
  I want to delete one of my bots
  So that I don"t have to see it anymore
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user_id: user.id) }

  scenario "user sees delete button on a bot show page" do
    login(user)
    visit user_bot_path(user, bot)
    find_button("Delete").visible?
  end

  scenario "user deletes bot from a bot show page " do
    login(user)
    visit user_bot_path(user, bot)
    click_on "Delete"
    expect(page).to_not have_content("bot.name")
  end

  scenario "user deletes bot from a bot edit page " do
    login(user)
    visit edit_bot_path(bot)
    click_on "Delete"
    expect(page).to_not have_content("bot.name")
  end

  scenario "only the creator of the bot can delete it" do
    user2= FactoryGirl.create(:user)
    login(user2)
    visit user_path(user)
    expect(page).to_not have_content("Delete")
  end
end
