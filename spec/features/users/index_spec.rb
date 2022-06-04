require "rails_helper"

describe "User index page" do
  before do
    visit "/users"
  end

  it "displays all users fist last name and email", :vcr do
    within "#user-1" do
      expect(page).to have_content("something this")
      expect(page).to have_content("Email: email@email.com")
    end
    within "#user-2" do
      expect(page).to have_content("asda this")
      expect(page).to have_content("Email: cheese@email.com")
    end
    within "#user-3" do
      expect(page).to have_content("monkey this")
      expect(page).to have_content("Email: foo@email.com")
    end
    # the this family :,^)
  end

  it "has links to users show pages", :vcr do
    within "#user-1" do
      click_link("something this")
    end
    expect(current_path).to eq("/users/1")

    expect(page).to have_content("something this's Page")
    expect(page).not_to have_content("asda this's Page")
  end
end
