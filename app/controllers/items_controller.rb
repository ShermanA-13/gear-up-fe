class ItemsController < ApplicationController
  def show
    user_1_attr = {id: 1, type: "user", attributes: {email: "user_1@gearup.test"}}
    user_1 = User.new(user_1_attr)
    item_1_attr = {id: 1, type: "item", attributes: {name: "Item 1", description: "1st Item Description", category: "Tent", user_id: user_1.id }}
    item_1 = Item.new(item_1_attr)

    @item = item_1
  end
end
