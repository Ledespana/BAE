require 'rails_helper'

feature 'user creates a bot', %Q{
  As an authenticated user
  I want to create my own bot
  So that I can have it personalized
} do

  scenario 'user visits bots new page' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_user_bot_path(user)
    expect(page).to have_content('Create a new BAE')
  end

  scenario 'user visits bots new page and introduces wrong data' do
    user = FactoryGirl.create(:user)
    mary = FactoryGirl.create(:bot, user_id: user.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_user_bot_path(user)

    click_button 'Create'

    expect(page).to have_content('Something went wrong')
  end

  scenario 'user creates a bot' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')

    visit new_user_bot_path(user)
    fill_in 'Name', with: 'Asia'
    select('Male', from: 'bot[gender]')
    select('Green', from: 'bot[eye_color]')
    select('Black', from: 'bot[hair_color]')
    fill_in('Age', with: 34)
    fill_in('Description', with: 'Romantic. Loves hiking and videogames')

    click_button('Create')
    
    expect(page).to have_content('BAE created!')

  end
end
