require "rails_helper"

feature "user updates interactions", %(
  As an authorized user
  I want to update an interactions of my vocabulary
  So I can change any of them

  Acceptance Criteria
  [X] I must have an edit button in the vocabulary pages
  [X] Depending of the category of the interaction I will be able to update
  different fields
  [ ] Once the interaction is edited I must be redirected to the interaction
  index page

) do
  let!(:user) { FactoryGirl.create(:user) }
end
