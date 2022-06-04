require "rails_helper"

describe "Item show page" do
  before do
    visit "/users/1/items/1"
  end

  it "displays the item's attributes (name, desc, categ)", :vcr do
    expect(page).to have_content("Item 1")
    expect(page).to have_content("Description: 1st Item Description")
    expect(page).to have_content("Item Category: Tent")

    expect(page).not_to have_content("Item 2")
    expect(page).not_to have_content("Description: 2nd Item Description")
    expect(page).not_to have_content("Item Category: Food")
  end

end
