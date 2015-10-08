require "rails_helper"

feature "user updates interactions", %(
  As an authorized user
  I want to update an interactions of my vocabulary
  So I can change any of them

  Acceptance Criteria
  [X] I must have an edit button in the vocabulary pages
  [X] Depending of the category of the interaction I will be able to update
  different fields
  [X] Once the interaction is edited I must be redirected to the interaction
  index page

) do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "visitor can't see update button for a sentence" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence
    )
    UsersInteraction.create(user: user2, interaction: interaction)

    visit user_interactions_path(user2)

    page.has_css?("fa fa-pencil")
  end

  scenario "visitor can't see update button for a keyword" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user2, interaction: interaction)

    visit user_interactions_path(user2)

    page.has_css?("fa fa-pencil")
  end

  scenario "visitor can't see update button for a combo" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user2, interaction: interaction)

    visit user_interactions_path(user2)

    page.has_css?("fa fa-pencil")
  end

  scenario "user updates a sentence from his vocabulary" do
    login(user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence
    )
    UsersInteraction.create(user: user, interaction: interaction)
    visit edit_user_interaction_path(user, interaction)
    fill_in "Response", with: "You are right"
    click_button("Submit")

    expect(page).to have_content("You are right")
  end

  scenario "user updates a keyword from his vocabulary" do
    login(user)
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user, interaction: interaction)
    visit edit_user_interaction_path(user, interaction)
    fill_in "Response", with: "You are right"
    click_button("Submit")

    expect(page).to have_content("You are right")
  end

  scenario "user updates a combo from his vocabulary" do
    login(user)
    interaction = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user, interaction: interaction)
    visit edit_user_interaction_path(user, interaction)
    fill_in "Response", with: "You are right"
    click_button("Submit")
    expect(page).to have_content("You are right")
  end

  scenario "user submit an empty form" do
    login(user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence
    )
    UsersInteraction.create(user: user, interaction: interaction)
    visit edit_user_interaction_path(user, interaction)
    fill_in "Response", with: ""
    click_button("Submit")

    expect(page).to have_content("Something went wrong")
  end
end
