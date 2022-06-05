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
end
