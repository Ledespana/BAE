require "rails_helper"

feature "user registers", %{
  As a visitor
  I want to register
  So that I can create an account
} do

  scenario "provide valid registration information" do
    visit new_user_registration_path

    fill_in "Username", with: "milo231"
    fill_in "Description", with: "I like hiking and videogames"
    fill_in "Email", with: "john@example.com"
    fill_in "user_phone_number", with: "1234567890"
    choose "user_gender_male"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "provide invalid registration information" do
    visit new_user_registration_path

    click_button "Sign up"
    expect(page).to have_content("can"t be blank")
    expect(page).to_not have_content("Sign Out")
  end
end
