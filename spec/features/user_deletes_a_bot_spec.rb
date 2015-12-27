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
    expect(page).to_not have_content(bot.name)
  end

  scenario "user deletes bot from a bot edit page " do
    login(user)
    visit edit_bot_path(bot)
    click_on "Delete"
    expect(page).to_not have_content(bot.name)
  end

  scenario "other users can't can delete other user's bot" do
    user2 = FactoryGirl.create(:user, phone_number: Faker::Number.number(10))
    login(user2)
    visit user_path(user)
    expect(page).to_not have_content("Delete")
  end

  scenario "Admin can delete any bot" do
    user2 = FactoryGirl.create(
      :user,
      phone_number: Faker::Number.number(10),
      role: "Admin"
      )
    login(user2)
    visit user_bot_path(user, bot)
    click_on "Delete"
    expect(page).to have_content("BAE deleted successfully")
  end
end
