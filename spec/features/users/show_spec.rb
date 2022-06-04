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

  it "shows a specific user's top 3 items", :vcr do
    # note: due to little test data,
    # this will only test for 2 items the user has.
    within "#items" do
      expect(page).to have_content("something this's Item Shed")

      expect(page).to have_content("Water Bottle")
      expect(page).to have_content("Count: 5")
      expect(page).to have_content("Item ID: 1")

      expect(page).to have_content("Trail Mix")
      expect(page).to have_content("Count: 8")
      expect(page).to have_content("Item ID: 2")

      expect(page).not_to have_content("Good Socks")
      expect(page).not_to have_content("Count: 3")
      expect(page).not_to have_content("Item ID: 3")
    end
  end

  it "has links to item show pages", :vcr do
    within "#items" do
      click_link "Water Bottle"
    end
    expect(current_path).to eq("/users/1/items/1")
    expect(page).to have_content("Name: Water Bottle")
  end
end
