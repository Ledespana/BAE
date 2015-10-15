require "rails_helper"

feature "user creates a bot", %{
  As an authenticated user
  I want to create my own bot
  So that I can have it personalized
} do

  scenario "user visits bots new page" do
    user = FactoryGirl.create(:user)
    login(user)

    visit new_bot_path
    expect(page).to have_content("Create a new BAE")
  end

  scenario "user visits bots new page and introduces wrong data" do
    user = FactoryGirl.create(:user)
    login(user)

    visit new_bot_path
    click_button "Submit"
    expect(page).to have_content("Something went wrong!")
  end

  scenario "user creates a bot" do
    user = FactoryGirl.create(
      :user,
      phone_number: ENV["TWILIO_PHONE_NUMBER"].sub("+1", "")
    )
    login(user)

    visit new_bot_path
    fill_in "Name", with: "Asia"
    select("Male", from: "bot[gender]")
    select("Green", from: "bot[eye_color]")
    select("Black", from: "bot[hair_color]")
    select("26", from: "bot[age]")
    fill_in("Description", with: "Romantic. Loves hiking and videogames")

    click_button("Submit")

    expect(page).to have_content("BAE created!")
  end

  scenario "user cannot create more than one bot" do
    user = FactoryGirl.create(
      :user,
      phone_number: ENV["TWILIO_PHONE_NUMBER"].sub("+1", "")
    )
    bot = FactoryGirl.create(:bot, user: user)
    login(user)

    visit new_bot_path
    fill_in "Name", with: "Asia"
    select("Male", from: "bot[gender]")
    select("Green", from: "bot[eye_color]")
    select("Black", from: "bot[hair_color]")
    select("26", from: "bot[age]")
    fill_in("Description", with: "Romantic. Loves hiking and videogames")

    click_button("Submit")

    expect(page).to have_content("You have reached the limits of BAEs")
  end
end
