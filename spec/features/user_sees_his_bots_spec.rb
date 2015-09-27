require 'rails_helper'

feature 'user sees his bots', %Q{
  As an authenticated user
  I want to see the list of my bots
  So that I can know the ones on my profile
} do

  scenario 'user visits bots index page' do
    user = FactoryGirl.create(:user)
    mary = FactoryGirl.create(:bot, user_id: user.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit user_bots_path(user)
    expect(page).to have_content(mary.name)
  end

  scenario 'user visits bot show page' do
    user = FactoryGirl.create(:user)
    mary = FactoryGirl.create(:bot, user_id: user.id)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit user_bot_path(user, mary)
    expect(page).to have_content(mary.name)
  end
end
