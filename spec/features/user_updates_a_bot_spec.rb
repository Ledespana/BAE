require 'rails_helper'

feature 'user udpdates his bots', %Q{
  As an authenticated user
  I want to update one of my bots
  So that I can have it personalized
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user_id: user.id) }

  before(:each) do
    login(user)
  end

  scenario 'user sees update button on the bots index page' do
    visit user_bots_path(user)
    within '.bot' do
      expect(page).to have_content('Update')
    end
  end

  scenario 'user sees udpdate button on a both update page ' do
    visit edit_user_bot_path(user, bot)
    expect(page).to have_content('Update')
  end

  scenario 'user visits bots udpdate page' do

  end

  scenario 'user visits bots udpdate page and introduces wrong data' do

  end

  scenario 'user updates bot from the bots index page ' do
  end

  scenario 'user updates bot from a bot show page ' do
  end

  scenario 'only the creator of the bot can update the bot' do
  end

  scenario 'only the creator of the bot sees update button' do
  end
end
