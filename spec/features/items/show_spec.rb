require "rails_helper"

describe "Item show page" do
  before do
    user_1_attr = {id: 1, type: "user", attributes: {email: "user_1@gearup.test"}}
    @user_1 = User.new(user_1_attr)

    item_1_attr = {id: 1, type: "item", attributes: {name: "Item 1", description: "1st Item Description", category: "Tent", user_id: @user_1.id }}
    @item_1 = Item.new(item_1_attr)

    item_2_attr = {id: 2, type: "item", attributes: {name: "Item 2", description: "2nd Item Description", category: "Food", user_id: @user_1.id }}
    @item_2 = Item.new(item_2_attr)

    visit "/users/#{@user_1.id}/items/#{@item_1.id}"
  end

  it "displays the item's attributes (name, desc, categ)" do
    expect(page).to have_content("Item 1")
    expect(page).to have_content("Description: 1st Item Description")
    expect(page).to have_content("Item Category: Tent")

    expect(page).not_to have_content("Item 2")
    expect(page).not_to have_content("Description: 2nd Item Description")
    expect(page).not_to have_content("Item Category: Food")
  end

end
