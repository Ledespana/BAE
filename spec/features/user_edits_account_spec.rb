require "rails_helper"

feature "user edits his account", %{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date
} do


  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login(user)
  end

  scenario "user visits edit path for his profile"do
    visit edit_user_registration_path(user)

    expect(page).to have_content("Edit User")
  end

  scenario "user updates  his profile"do
    visit edit_user_registration_path(user)
    fill_in "Username", with: "milo231"
    fill_in "Description", with: "I like hiking and videogames"
    choose "user_gender_male"
    fill_in "Email", with: "john@edsafaxample.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Current password", with: user.password
    fill_in "user_phone_number", with: "1234567890"
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "user tries to update profile with invalid data" do
    visit edit_user_registration_path(user)
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"

    click_button "Update"
    expect(page).to have_content("Password is too short")
  end

  scenario "user tries to update profile with empty form" do
    visit edit_user_registration_path(user)

    click_button "Update"
    expect(page).to have_content("Current password can't be blank")
  end
end
