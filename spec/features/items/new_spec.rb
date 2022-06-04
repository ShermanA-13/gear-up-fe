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
    expect(find('form')).to have_content('Tent')
    expect(find('form')).to have_content('Sleeping Bag')
    expect(find('form')).to have_content('Stoves, Grills & Fuel')

    expect(find('form')).to have_button('Add Item')
  end

  it "displays no form when user visits page", :vcr do
    visit "/users/2/items/new"
    expect(page).not_to have_css("form")

    expect(page).to have_content("How did you get here...")
  end
end
