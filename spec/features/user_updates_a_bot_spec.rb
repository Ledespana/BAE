require "rails_helper"

feature "user udpdates his bots", %{
  As an authenticated user
  I want to update one of my bots
  So that I can have it personalized
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user: user) }

  before(:each) do
    login(user)
  end

  scenario "user sees edit button on the bots index page" do
    visit user_bots_path(user)
    within ".bot" do
      find_link("Edit").visible?
    end
  end

  scenario "user sees udpdate button on a bot show page " do
    visit user_bot_path(user, bot)
    find_link("Edit").visible?
  end

  scenario "user visits bots update page and introduces wrong data" do
    visit edit_user_bot_path(user, bot)
    fill_in "Name", with: ""
    click_button("Submit")
    expect(page).to have_content("Something went wrong")
  end

  scenario "user updates bot from the bots index page " do
    visit user_bots_path(user)
    click_link("Edit")
    fill_in "Name", with: "Marcos"
    click_button("Submit")
    expect(page).to have_content("BAE edited successfully")
  end

  scenario "user updates bot from a bot show page " do
    visit user_bot_path(user, bot)
    click_link("Edit")
    fill_in "Name", with: "Marcos"
    click_button("Submit")
    expect(page).to have_content("BAE edited successfully")
  end

  scenario "only the creator of the bot can update the bot" do
    user2 = FactoryGirl.create(:user)
    bot2 = FactoryGirl.create(:bot, user: user2)

    visit user_bot_path(user2, bot2)
    !find_link("Edit").visible?

    visit edit_user_bot_path(user2, bot2)
    expect(page).to have_content("You have no permission to edit this BAE")


    visit user_bot_path(user, bot)
    click_link("Edit")
    fill_in "Name", with: "Marcos"
    click_button("Submit")
    expect(page).to have_content("Marcos")
  end

  scenario "only the creator of the bot sees update button on the bot index page" do
    visit user_bots_path(user)
    expect(page).to have_content("Edit")

    user2 = FactoryGirl.create(:user)
    bot2 = FactoryGirl.create(:bot, user: user2)
    visit user_bots_path(user2)

    !find_link("Edit").visible?
  end
end
