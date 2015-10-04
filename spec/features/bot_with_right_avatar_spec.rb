require "rails_helper"

feature "user sees the right avatar for his bot", %{
  As an authenticated user
  I want to see an avatar of my bot that fits his description
  So that I can my bot can have the right avatar
} do

  scenario "user sees the right avatar for a male,blonde, green eyes bot " do
    user = FactoryGirl.create(:user)
    login(user)
    mary = FactoryGirl.create(
      :bot,
      gender: "Male",
      hair_color: "Blonde",
      eye_color: "Green",
      user: user
      )

    visit user_path(user)
    expect(page).to have_xpath(
      '//img[@src="/assets/Male-Blonde-Green.png"]'
      )
  end
end
