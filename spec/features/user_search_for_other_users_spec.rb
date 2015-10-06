require "rails_helper"

feature "User searches for a user", %(
  As a user
  I want to search for others users
  So that I can view their profile

  Acceptance Criteria
  [X] I must be displayed with all the users that match my search
) do
  scenario "visitor searches for another user" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)
    user5 = FactoryGirl.create(:user, username: "Thor")

    visit users_path
    fill_in "search", with: "Thor"
    click_button "Search"
    expect(page).to have_content(user5.username)
    expect(page).to_not have_content(user1.username)
    expect(page).to_not have_content(user2.username)
    expect(page).to_not have_content(user3.username)
    expect(page).to_not have_content(user4.username)
  end
end
