require "rails_helper"

feature "Visitor sees a list of all the users", %(
  As a visitor
  I want to see all the users of the app
  So that I can see one with more detail

  Acceptance Criteria
  [X] I must see the list of all the users
  [] For each user I must see: his avatar, number of BAES
  and Total of Vocabulary
  [X] I must be able to click on a user an see his show page
  [X] I must be able to search for a specific user
) do
  scenario "visitor sees list of users" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, phone_number: Faker::Number.number(10))

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
    expect(page).to have_content("Description")
  end

  scenario "user sees a maximum of 12 users per page" do
    15.times do
      FactoryGirl.create(
        :user,
        username: Faker::Name.name,
        phone_number: Faker::Number.number(10)
      )
    end

    visit users_path
    expect(page).to have_selector(".user", count: 12)
  end
end
