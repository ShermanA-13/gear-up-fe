require "rails_helper"

describe "Item new page" do
  before do
    visit "/login?user_id=1"
    visit "/users/1/items/new"
  end
  it "has a form to create a new item", :vcr do
    expect(find('form')).to have_content('Item Name')
    expect(find('form')).to have_content('Description')
    expect(find('form')).to have_content('Count')
    expect(find('form')).to have_content('Tents')
    expect(find('form')).to have_content('Sleeping Bag')
    expect(find('form')).to have_content('Stoves, Grills & Fuel')

    expect(find('form')).to have_button('Add Item')
  end

  it "displays no form when user visits page", :vcr do
    visit "/users/2/items/new"
    expect(page).not_to have_css("form")
    expect(page).to have_content("How did you get here...")
  end

  it "creates a new item and redirects to item show page", :vcr do
      fill_in 'Item Name', with: "Tent 1"
      fill_in 'Description', with: "1 person Tent"
      fill_in 'Count', with: "1"
      choose option: '0'

      click_button 'Add Item'

      expect(page).to have_content("Name: Tent 1")
      expect(page).to have_content("Description: 1 person Tent")
      expect(page).to have_content("Count: 1")
      expect(page).to have_content("Item Category: Tents")
      # expect(page).to have_content("Item Category: 1")
  end
end
