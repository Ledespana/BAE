require 'rails_helper'

RSpec.describe Interaction, type: :model do
  it { should have_many(:bots_interactions) }
  it { should have_many(:bots).through(:bots_interactions) }

  it { should validate_presence_of :category}
  it { should validate_presence_of :response}


  scenario "one_of_three_interactions returns error if sentence is blank" do
    interaction = Interaction.create(
      category: "Sentence",
      sentence: '',
      response: Faker::Lorem.sentence
    )
    expect(interaction.one_of_three_interactions).to eq(["You need to fill the sentence field", "You need to fill the sentence field"])
  end

  scenario "one_of_three_interactions returns error if keyword1 is blank choosing category keyword" do
    interaction = Interaction.create(
      category: "Keyword",
      sentiment: "Positive",
      keyword1: '',
      response: Faker::Lorem.sentence,
    )
    expect(interaction.one_of_three_interactions).to eq(["You need to fill the keyword field", "You need to fill the keyword field"])
  end


  scenario "one_of_three_interactions returns error if keyword1 is blank choosing category combo" do
    interaction  = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: '',
      keyword2: Faker::Lorem.word,
      response: Faker::Lorem.sentence,
    )
    expect(interaction.one_of_three_interactions).to eq(["You need to fill the form", "You need to fill the form"])
  end

  scenario "one_of_three_interactions returns error if keyword2 is blank choosing category combo" do
    interaction  = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: Faker::Lorem.word,
      keyword2: '',
      response: Faker::Lorem.sentence,
    )
    expect(interaction.one_of_three_interactions).to eq(["You need to fill the form", "You need to fill the form"])
  end

  scenario "one_of_three_interactions returns error if keyword1 and keyword2 are blank choosing category combo" do
    interaction  = Interaction.create(
      category: "Combo",
      sentiment: "Positive",
      keyword1: '',
      keyword2: '',
      response: Faker::Lorem.sentence,
    )
    expect(interaction.one_of_three_interactions).to eq(["You need to fill the form", "You need to fill the form"])
  end


end
