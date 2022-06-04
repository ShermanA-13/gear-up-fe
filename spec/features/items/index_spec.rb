require "rails_helper"

describe "Item index/shed" do
  before do
    visit "/users/1/items"
  end

  it "displays all of the users items", :vcr do
    within "#item-1" do
      expect(page).to have_content("Water Bottle")
      expect(page).to have_content("Count: 5")
      expect(page).to have_content("Item ID: 1")
    end
    within "#item-2" do
      expect(page).to have_content("Trail Mix")
      expect(page).to have_content("Count: 8")
      expect(page).to have_content("Item ID: 2")
    end

    expect(page).not_to have_content("Good Socks")
    expect(page).not_to have_content("Count: 3")
    expect(page).not_to have_content("Item ID: 3")
  end
end
