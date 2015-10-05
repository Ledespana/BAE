require 'rails_helper'

feature "Visitor sees a list of all the users", %(
  As a visitor
  I want to see all the users of the app
  So that I can see one with more detail

  Acceptance Criteria
  [] I must see the list of all the users
  [] For each user I must see: his avatar, number of BAES, and Total of Vocabulary
  [] I must be able to click on a user an see his show page
  [] I must be able to search for a specific user
) do

  scenario "visitor sees list of users" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    visit root_path
    click_on("Users")
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user1.bots.count)

    expect(page).to have_content(user2.username)
    expect(page).to have_content(user2.bots.count)
  end

  scenario "visitor sees list of users" do
    user1 = FactoryGirl.create(:user)
    visit users_path
    click_on(user1.username)
    expect(page).to have_content(user1.username)
    expect(page).to have_content('List of BAEs')
  end

  scenario "user searches for users" do
    FactoryGirl.create(
      :user,
      email: "bob@aol.com",
      username: "markus"
      )
    FactoryGirl.create(
      :user,
      email: "sam@aol.com",
      username: "mike23"
      )
    FactoryGirl.create(
      :user,
      email: "joe@aol.com",
      username: "bob"
      )
    FactoryGirl.create(
      :user,
      email: "nick@gmail.com",
      username: "nick"
      )
    visit users_path
    within(".search-user") do
      fill_in "search", with: "bob"
      click_button("Search")
    end
    expect(page).to have_content("bob")
    expect(page).to_not have_content("nick")
  end

end
