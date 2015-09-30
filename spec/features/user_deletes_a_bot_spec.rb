require 'rails_helper'

feature 'user udpdates his bots', %Q{
  As an authenticated user
  I want to delete one of my bots
  So that I don't have to see it anymore
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user_id: user.id) }


  scenario 'user sees delete button on the bots index page' do
    login(user)
    visit user_bots_path(user)
    within 'bot' do
      expect(page).to have_content('Delete')
    end
  end

  scenario 'user sees delete button on a both update page' do
    login(user)
    visit edit_user_bot_path(user, bot)
    expect(page).to have_content('Delete')
  end

  scenario 'user deletes bot from the bots index page ' do
    login(user)
    visit user_bots_path(user)
    within 'bot' do # I have to create a special class for each bot
      expect(page).to have_content('Still thinking')
    end
  end

  scenario 'user deletes bot from a bot show page ' do
    login(user)
    visit edit_user_bot_path(user, bot)
    click_button 'Delete'
    expect(page).to_not have_content('bot.name')
  end

  scenario 'only the creator of the bot can delete it' do
    user2= FactoryGirl.create(:user)
    login(user2)
    visit user_bots_path(user)
    expect(page).to_not have_content('Delete')
  end
end
