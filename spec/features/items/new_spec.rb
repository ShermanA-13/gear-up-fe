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

    expect(find('form')).to have_button('Add Item')
  end
end
