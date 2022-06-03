require "rails_helper"

describe "Item poro" do
  before do
    item_1_attr = {id: 1, type: "item", attributes: {name: "Item 1", description: "1st Item Description", category: "Tent" }}
    @item_1 = Item.new(item_1_attr)

    item_2_attr = {id: 2, type: "item", attributes: {name: "Item 2", description: "2nd Item Description", category: "Food" }}
    @item_2 = Item.new(item_2_attr)
  end

  it "exists and has attributes" do
    expect(@item_1).to be_a(Item)
    expect(@item_1.id).to eq(1)
    expect(@item_1.name).to eq("Item 1")
    expect(@item_1.description).to eq("1st Item Description")
    expect(@item_1.category).to eq("Tent")


    expect(@item_2).to be_a(Item)
    expect(@item_2.name).to eq("Item 2")
  end
end
