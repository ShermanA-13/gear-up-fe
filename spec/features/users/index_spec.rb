require "rails_helper"

describe "User index page" do
  before do
    visit "/users"
  end

  it "displays all users fist last name and email" do
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
end
