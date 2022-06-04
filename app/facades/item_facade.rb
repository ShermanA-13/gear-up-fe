class ItemFacade
  def self.find_item(user_id, item_id)
    data = ItemService.find_item(user_id, item_id)[:data]
    Item.new(data)
  end

  def self.items(user_id)
    ItemService.items(user_id)[:data].map do |data|
      Item.new(data)
    end
  end
end
