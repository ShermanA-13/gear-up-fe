require "rails_helper"

describe "item edit page" do
  before do
    visit "/login?user_id=1"
    visit "/users/1/items/2/edit"
  end
  it "has a form to edit an item", :vcr do
    expect(find('form')).to have_content('Item Name')
    expect(find('form')).to have_content('Description')
    expect(find('form')).to have_content('Count')
    expect(find('form')).to have_content('1')
    expect(find('form')).to have_content('Sleeping Bag')
    expect(find('form')).to have_content('Stoves, Grills & Fuel')

    expect(find('form')).to have_button('Update Item')
  end

  it "updates the item when form is filled out", :vcr do
    fill_in 'Description', with: "My Favorite Trail Mix"
    choose option: '1'

    click_button "Update Item"

    expect(current_path).to eq("/users/1/items/2")
    expect(page).to have_content("Description: My Favorite Trail Mix")
  end

  it "does not show the form when visiting a different users edit page", :vcr do
    visit "/users/2/items/3/edit"
    expect(page).not_to have_css("form")

    expect(page).to have_content("How did you get here...")
  end
end
