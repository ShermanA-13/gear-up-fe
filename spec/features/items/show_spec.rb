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

end
