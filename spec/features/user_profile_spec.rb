require "rails_helper"

feature "user sees his and others profile", %{
  As an authenticated user
  I want to see my profile and others profile
  So I can see my profile details and others.
}do
  # Acceptance Criteria
  # [X] User clicking on "Profile" should show a page with his profile
  # [X] I should see my list of bots
  # [X] I should see a link to each bot show page
  # [X] I should see the the number of bots that I have
  # [X] I should see my BAEs vocabulary (total of sentences, keywords
  # and combination of keywords)

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bot) { FactoryGirl.create(:bot, user: user) }

  before(:each) do
    login(user)
  end

  scenario "user visits his profile" do
    visit user_path(user)
    expect(page).to have_content(user.username)
  end

  scenario "user sees his bot" do
    visit user_path(user)
    expect(page).to have_content(bot.name)
  end
end
