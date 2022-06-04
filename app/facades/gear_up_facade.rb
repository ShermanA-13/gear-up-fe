class GearUpFacade

  def self.find_item(user_id, item_id)
    data = GearUpService.find_item(user_id, item_id)[:data]
    Item.new(data)
  end
end
