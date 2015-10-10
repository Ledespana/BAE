require "rails_helper"

feature "user adds interactions", %(
  As an authorized user
  I want to add interactions to my vocabulary
  So that I add them to my bots

  Acceptance Criteria
  [X] I must go to a page to add an interactions
  [X] I will see a different form depending of the category of the interaction
  [X] I must be redirected to my vocabulary page.
  [X] I must be able to add and interaction from other users table

) do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user goes to the new interaction page clicking on add vocabulary" do
    login(user)
    visit user_interactions_path(user)
    click_link "Add vocabulary"
    expect(page).to have_content("Create a new interaction")
  end

  scenario "other users can't see the button add vocabulary" do
    visit user_interactions_path(user)

    expect(page).to_not have_css(".add_vocabulary")

    login(user)
    visit user_interactions_path(user)
    expect(page).to have_css(".add_vocabulary")
  end

  scenario "user adds a sentence to his vocabulary" do
    login(user)
    visit new_user_interaction_path(user)
    select("Sentence", from: "Category")
    fill_in "Sentence", with: "Hi! How are you?"
    fill_in "Response", with: "I'm great :)"
    click_button("Submit")

    expect(page).to have_content("Interaction created!")
  end

  scenario "user adds a keyword to his vocabulary" do
    login(user)
    visit new_user_interaction_path(user)
    select("Keyword", from: "Category")
    select("Positive", from: "Sentiment")
    fill_in "interaction[keyword1]", with: "love"
    fill_in "Response", with: "You know what I love, talking to you"
    click_button("Submit")

    expect(page).to have_content("Interaction created!")
  end

  scenario "user adds a combo to his vocabulary" do
    login(user)
    visit new_user_interaction_path(user)
    select("Combo", from: "Category")
    select("Positive", from: "Sentiment")
    fill_in "interaction[keyword1]", with: "love"
    fill_in "interaction[keyword2]", with: "cars"

    fill_in "Response", with: "I may be able to find you a car :)"
    click_button("Submit")

    expect(page).to have_content("Interaction created!")
  end

  scenario "user only sees the right fields" do
    login(user)
    visit new_user_interaction_path(user)
    select("Sentence", from: "Category")
    page.has_css?("sentence_interaction")
    page.has_css?("second_keyword hidden")
    page.has_css?("combo hidden")

    select("Keyword", from: "Category")
    page.has_css?("sentence_interaction hidden")
    page.has_css?("second_keyword hidden")
    page.has_css?("combo")

    select("Combo", from: "Category")
    page.has_css?("sentence_interaction hidden")
    page.has_css?("second_keyword hidden")
    page.has_css?("combo")
  end

  scenario "user visits other user table and adds a sentence to his interacions" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence,
      user_id: user2.id
    )

    login(user)
    visit user_interactions_path(user2)
    choose("r1")
    click_on "Add"
    expect(page).to have_content("Interaction created!")
  end

  scenario "user visits other user table and adds a keyword to his interacions" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
      user_id: user2.id
    )

    login(user)
    visit user_interactions_path(user2)
    choose("r2")
    click_on "Add"
    expect(page).to have_content("Interaction created!")
  end

  scenario "user visits other user table and adds a combo to his interacions" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
      user_id: user2.id
    )

    login(user)
    visit user_interactions_path(user2)
    choose("r3")
    click_on "Add"
    expect(page).to have_content("Interaction created!")
  end
end
