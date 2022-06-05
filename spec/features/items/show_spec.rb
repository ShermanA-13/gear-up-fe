require "rails_helper"

describe "Item show page" do
  before do
    visit "/users/1/items/1"
  end

  it "displays the item's attributes (name, desc, categ)", :vcr do
    expect(page).to have_content("Name: Water Bottle")
    expect(page).to have_content("Count: 5")
    expect(page).to have_content("Item Category: 0")

    expect(page).not_to have_content("Name: Trail Mix")
    expect(page).not_to have_content("Count: 8")
  end

  it "has a link to return to the user's item index", :vcr do
    click_link("Return to the Item Shed")

    expect(current_path).to eq("/users/1/items")
  end
end
