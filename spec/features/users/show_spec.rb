require "rails_helper"

describe "user show page" do
  before do
    visit "/users/1"
  end

  it "shows a specific user's data", :vcr do
    expect(page).to have_content("something this's Page")
    expect(page).to have_content("Email: email@email.com")

    expect(page).not_to have_content("asda this's Page")
    expect(page).not_to have_content("Email: cheese@email.com")
  end
end
