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
describe "delete item" do
  before do
    visit "/login?user_id=1"
  end
  it "has a link to delete an item", :vcr do
    visit "/users/1/items"
    click_link "Trail Mix"

    expect(page).to have_link("Delete Trail Mix")
  end

  it "does not have delete link on other users item pages", :vcr do
    visit "/users/2/items"
    click_link "Good Socks"

    expect(page).not_to have_link("Delete Good Socks")
  end
end

describe "update item" do
  before do
    visit "/login?user_id=1"
    click_link("Trail Mix")

  end

  it "has a button taking you to the update page", :vcr do
    expect(page).to have_button("Edit Trail Mix")
  end
  it "the button takes you to the update page", :vcr do
    click_button "Edit Trail Mix"
    expect(current_path).to eq("/users/1/items/2/edit")
  end
end
