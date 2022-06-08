require "rails_helper"

describe "Item show page" do
  before do
    data = {
      first_name: 'Bonny',
      last_name: 'Jowman',
      email: 'ivebeentrapped@inthecomputer.org',
      user_photo: 'https://lh3.googleusercontent.com/a-/AOh14GjhYI5RIF0qkDbiUtgXjH59K7hoEZ1QpLykFsEh2g=s96-c'
    }
    @user = UserFacade.create_user(data)

    visit "/login?user_id=#{@user.id}"
    visit "/users/#{@user.id}/items/new"
    fill_in 'Item Name', with: "Organic Crash Pad"
    fill_in 'Description', with: "Large, red and blue"
    fill_in 'Count', with: "5"
    choose option: '8'
    click_button 'Add Item'
  end

  it "displays the item's attributes (name, desc, categ)", :vcr do
    expect(page).to have_content("Name: Organic Crash Pad")
    expect(page).to have_content("Count: 5")
    expect(page).to have_content("Item Category: Crash Pads")

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
    visit "/login?user_id=3"
  end

  it "has a link to delete an item", :vcr do
    visit "/users/3/items"
    within '#item-2' do
      click_link 'View Item'
    end

    expect(page).to have_link("Delete Trail Mix")
  end

  it "does not have delete link on other users item pages", :vcr do
    visit "/users/2/items"
    within '#item-3' do
      click_link 'View Item'
    end

    expect(page).not_to have_link("Delete Good Socks")
  end
end

describe "update item" do
  before do
    visit "/login?user_id=3"
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
