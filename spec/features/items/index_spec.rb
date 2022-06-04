require "rails_helper"

describe "Item index/shed" do
  before do
    # VCR.insert_cassette("displays_all_of_the_users_items")
    visit "/users/1/items"
  end

  after do
    # VCR.eject_cassette
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

  it "each item links to the item's show page", :vcr do
    click_link("Water Bottle")

    expect(current_path).to eq("/users/1/items/1")
    expect(page).to have_content("Name: Water Bottle")
    expect(page).to have_content("Count: 5")

    expect(page).not_to have_content("Trail Mix")
    expect(page).not_to have_content("Count: 8")
  end
end

describe "create an item" do
  before do
    visit "/login?user_id=1"
    click_link("something this's Shed")
  end

  it "has a button to create a new item", :vcr do
    click_button("Add an item to your Shed")

    expect(current_path).to eq("/users/1/items/new")
  end
end
