require "rails_helper"

feature "User sees his vocabulary index page", %(
  As a visitor
  I want to see all the interactions for my bots
  So that I can use them

  Acceptance Criteria
  [X] I must see the list of all the interactions
  [X] I must be able to hide tables depending of the category of the interaction
  [ ] I must be able to have a link that it will send the user to new_interaction_path
  [ ] I must be able to have a link that it will send the user to edit_interaction_path
  [ ] I must be able to delete any interaction
  [ ] I must be able to visit other users interactions index page
  [ ] I must be able to add any interaction from other users interactions index page

) do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    10.times do
      Interaction.create(
        category: "Sentence",
        sentence: Faker::Lorem.sentence,
        response: Faker::Lorem.sentence
      )
      UsersInteraction.create(user: user, interaction: Interaction.last)

      Interaction.create(
        category: "Keyword",
        sentiment: "Positive",
        keyword1: Faker::Lorem.word,
        response: Faker::Lorem.sentence,
      )
      UsersInteraction.create(user: user, interaction: Interaction.last)

      Interaction.create(
        category: "Combo",
        sentiment: "Positive",
        keyword1: Faker::Lorem.word,
        keyword2: Faker::Lorem.word,
        response: Faker::Lorem.sentence,
      )
      UsersInteraction.create(user: user, interaction: Interaction.last)
    end
  end

  scenario "user sees his sentences in the interaction index page" do
    visit user_interactions_path(user)

    choose("r1")
    expect(page).to have_content(user.interactions.first.sentence)
    expect(page).to have_content(user.interactions.first.response)
    expect(page).to have_content(user.interactions.second.sentence)
    expect(page).to have_content(user.interactions.second.response)
    page.has_css?("sentences row text-center")
    page.has_css?("keywords row text-center hidden")
    page.has_css?("combo row text-center hidden")
  end

  scenario "user sees his keywords in the interaction index page" do
    visit user_interactions_path(user)

    choose("r2")
    expect(page).to have_content(user.interactions.first.sentence)
    expect(page).to have_content(user.interactions.first.response)
    expect(page).to have_content(user.interactions.second.sentence)
    expect(page).to have_content(user.interactions.second.response)
    page.has_css?("sentences row text-center hidden")
    page.has_css?("keywords row text-center")
    page.has_css?("combo row text-center hidden")
  end

  scenario "user sees his combos in the interaction index page" do
    visit user_interactions_path(user)

    choose("r3")
    expect(page).to have_content(user.interactions.first.sentence)
    expect(page).to have_content(user.interactions.first.response)
    expect(page).to have_content(user.interactions.second.sentence)
    expect(page).to have_content(user.interactions.second.response)
    page.has_css?("sentences row text-center hidden")
    page.has_css?("keywords row text-center hidden")
    page.has_css?("combo row text-center")
  end
end
