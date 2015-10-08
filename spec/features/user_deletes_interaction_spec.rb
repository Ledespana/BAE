require "rails_helper"

feature "user deletes interactions", %(
  As an authorized user
  I want to delete an interactions from my vocabulary
  So I can delete any of them

  Acceptance Criteria
  [X] I must have a delete button in the vocabulary pages
  [X] Once the interaction is deleted I must be redirected to the interaction
  index page

) do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login(user)
  end

  scenario "visitor can't see delete button for a sentence" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence
    )
    UsersInteraction.create(user: user2, interaction: interaction)

    visit user_interactions_path(user2)

    page.has_css?("fa fa-trash-o")
  end

  scenario "visitor can't see delete button for a keyword" do
    user2 = FactoryGirl.create(:user)
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user2, interaction: interaction)

    visit user_interactions_path(user2)

    page.has_css?("fa fa-trash-o")
  end

  scenario "visitor can't see delete button for a combo" do
    user2 = FactoryGirl.create(:user)
    interaction  = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user2, interaction: interaction)

    visit user_interactions_path(user2)

    page.has_css?("fa fa-trash-o")
  end

  scenario "visitor deletes a sentence from his vocabulary" do
    interaction = Interaction.create(
      category: "Sentence",
      sentence: Faker::Lorem.sentence,
      response: Faker::Lorem.sentence
    )
    UsersInteraction.create(user: user, interaction: interaction)

    visit user_interactions_path(user)
    choose("r1")
    expect(page).to have_content(interaction.sentence)
    page.find("#delete_button").click
    expect(page).to_not have_content(interaction.sentence)
  end

  scenario "visitor deletes a keyword from his vocabulary" do
    interaction = Interaction.create(
    category: "Keyword",
    sentiment: "Positive",
    keyword1: Faker::Lorem.word,
    response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user, interaction: interaction)

    visit user_interactions_path(user)
    choose("r2")
    expect(page).to have_content(interaction.response)
    page.find("#delete_button").click
    expect(page).to_not have_content(interaction.response)
  end

  scenario "visitor deletes a combo from his vocabulary" do
    interaction = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    UsersInteraction.create(user: user, interaction: interaction)

    visit user_interactions_path(user)
    choose("r3")
    expect(page).to have_content(interaction.response)
    page.find("#delete_button").click
    expect(page).to_not have_content(interaction.response)
  end
end
